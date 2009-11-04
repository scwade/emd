require 'digest/sha1'

class User < ActiveRecord::Base

# ----------------------------------
# Custom class and framework methods
# ----------------------------------
  attr_accessor :password_confirmation

# -------------------------
# Custom instance methods
# -------------------------
  # 'password' is a virtual attribute
  def password
    @password
  end

  def password=(pwd)
    @password = pwd
    encript_password() unless pwd.blank?
  end

  def after_destroy
#    if User.count.zero?
#    This raise is used wrong, there s/b a rescue or flash(:error, or :notice, etc)
      raise "Can't delete last user" if User.count.zero?
#    end
  end

# ------------------------------------
# Scott code not implemented anywhere
# -----------------------------------
#    def self.authenticate(name, password)
#    user = self.find_by_name(name)
#    if user
#      expected_password = encrypted_password(password, user.salt)
#      if user.hashed_password != expected_password
#        user = nil
#      end
#    end
#    user
#  end

# ------------------------------
# All Methods are private scope
# ------------------------------
  private

  def encript_password()
    self.salt = object_id.to_s + ActiveSupport::SecureRandom.random_number.to_s
    self.hashed_password = Digest::SHA1.hexdigest(@password + "wibble" + self.salt)
  end

  # Need custom validation here 
  def password_non_blank
    errors.add(:password,  "Missing") if self.hashed_password.blank?
    if self.salt.blank? && !self.hashed_password.blank?
      errors.add(:salt, "System Error: contact system administrator")
   end
  end


# --------------------
# Custom validations
# --------------------
  validates_confirmation_of :password
  validate :password_non_blank

# ------------------
# Length validations
# ------------------
  validates_length_of   :name,             :maximum => 255,  :allow_blank => false
#  validates_length_of   :hashed_password,  :maximum => 40,   :allow_blank => false
#  validates_length_of   :salt,             :maximum => 30,   :allow_blank => false

# --------------------
# Presence validations
# Note: :hashed_password and :salt checked with :password_non_blank to
#       post only 1 message to user, instead of "salt is blank" and "
#       "hashed_password is blank", which they know nothing about.
# --------------------
  validates_presence_of :name

# ----------------------
# Uniqueness validations
# ----------------------
  validates_uniqueness_of :name,
                          :case_sensitive => :false,
                          :message => "not unique, already used by different user"

# ------------
# End of User
# ------------
end

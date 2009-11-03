require 'digest/sha1'

class User < ActiveRecord::Base

# ------------------------------
# All Methods are private scope
# ------------------------------
  private

# ----------------------------------
# Custom class and framework methods
# ----------------------------------
  attr_accessor :password_confirmation

  def self.authenticate(name, password)
    user = self.find_by_name(name)
    if user
      expected_password = encrypted_password(password, user.salt)
      if user.hashed_password != expected_password
        user = nil
      end
    end
    user
  end

  def self.encrypted_password(password, salt)
    string_to_hash = password + "wibble" + salt
    Digest::SHA1.hexdigest(string_to_hash)
  end

# -------------------------
# Custom instance methods
# -------------------------
  # 'password' is a virtual attribute
  def password
    @password
  end

  def password=(pwd)
    @password = pwd
    return if pwd.blank?
    create_new_salt
    self.hashed_password = User.encrypted_password(self.password, self.salt)
  end

  def after_destroy
    if User.count.zero?
      raise "Can't delete last user"
    end
  end

  def password_non_blank
    errors.add(:password, "Missing password") if hashed_password.blank?
  end

  def create_new_salt
    self.salt = self.object_id.to_s + rand.to_s
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
  validates_length_of   :hashed_password,  :maximum => 255,  :allow_blank => false
  validates_length_of   :salt,             :maximum => 255,  :allow_blank => false

# --------------------
# Presence validations
# --------------------
  validates_presence_of :name, :hashed_password, :salt

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

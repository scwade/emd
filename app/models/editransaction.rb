class Editransaction < ActiveRecord::Base

# -------------------------------------------
# Data entry validation for UI - Scotts stuff 
# -------------------------------------------

# should be a format validation
#protected
#                def fieled_must_be_higher_than_zero
#                        errors.add(:isa01, "should have number non zero ") if isa01.nil? || isa01 < 01
#                end

# ------------------
# Format validations
# ------------------

#  validates_format_of :isa01,
#                      :unless => Proc.new { |e| e.isa01.blank? },
#                      :with => /\d{1,2}$/

# ------------------
# Length validations
# ------------------

  validates_length_of   :isa01,    :maximum => 2
  validates_length_of   :isa02,    :maximum => 10
  validates_length_of   :isa03,    :maximum => 2,    :allow_blank => true
  validates_length_of   :isa04,    :maximum => 10,   :allow_blank => true
  validates_length_of   :isa05,    :maximum => 2,    :allow_blank => true
  validates_length_of   :isa06,    :maximum => 15,   :allow_blank => true
  validates_length_of   :isa07,    :maximum => 2,    :allow_blank => true
  validates_length_of   :isa08,    :maximum => 15,   :allow_blank => true
  validates_length_of   :isa09,    :maximum => 6,    :allow_blank => true
  validates_length_of   :isa10,    :maximum => 4,    :allow_blank => true
  validates_length_of   :isa11,    :maximum => 1,    :allow_blank => true
  validates_length_of   :isa12,    :maximum => 5,    :allow_blank => true
  validates_length_of   :isa13,    :maximum => 9,    :allow_blank => true
  validates_length_of   :isa14,    :maximum => 1,    :allow_blank => true
  validates_length_of   :isa15,    :maximum => 1,    :allow_blank => true
  validates_length_of   :isa16,    :maximum => 1,    :allow_blank => true



# --------------------
# Presence validations
# --------------------

  validates_presence_of :isa01,  :isa02

#-------------------
# End of model class
#-------------------
end


# Scotts stuff
#	validates_presence_of :isa01, :isa02, :isa03
#  validates_numericality_of :isa01, :isa03
#  validates_length_of :isa01, :maximum => 2, :message=> "Must be 2 characters"
#  validates_length_of :isa01, :minimum => 2, :too_short => "Must be 2 characters"
#  validates_uniqueness_of :isa01
#  Validation not currently applicable
#  validate :fieled_must_be_higher_than_zero
#  validates_associated :user

#data entry validation for UI
#protected
#		def fieled_must_be_higher_than_zero
#			errors.add(:isa01, "should have number non zero ") if isa01.nil? || isa01 < 01
#		end
#
#  Some validations for later
#  validates_format_of :image_url,
#                      :with    => %r{\.(gif|jpg|png)$}i,
#                      :message => 'must be a URL for GIF, JPG ' +
#                                  'or PNG image.'

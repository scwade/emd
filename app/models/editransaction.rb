class Editransaction < ActiveRecord::Base

# ------------------------------
# All Methods are private scope
# ------------------------------
  private

# ------------------
# Format validations
# ------------------

#  Just a template 
#  validates_numericality_of :isa01, :isa03
#                            :unless => Proc.new { |e| e.isa01.blank? },
#                            :only_integer => true,
#                            :greater_than => 0,
#                            :with => /\d{1,2}$/

  # Ok, check first digit is not '0' and length check is
  # forced by adding /$/ to regular expression
  # IMPORTANT: No leading zero's allowed 

  # :allow_nil => true used for number check, use
  # :allow_blank => true for strings or to cover
  # both use :unless => Proc.new { |v| v.<attribute>.blank? }

  # 1-2 digits > 0
  validates_format_of :isa01,
                      :with => /^[1-9]\d{0,1}$/
  validates_format_of :isa03,
                      :allow_nil => true,
                      :with => /^[1-9]\d{0,1}$/
  validates_format_of :isa05,
                      :allow_nil => true,
                      :with => /^[1-9]\d{0,1}$/
  validates_format_of :isa07,
                      :allow_nil => true,
                      :with => /^[1-9]\d{0,1}$/

  # 1-10 digits > 0
  validates_format_of :isa02,
                      :with => /^[1-9]\d{0,9}$/
  validates_format_of :isa04,
                      :allow_nil => true,
                      :with => /^[1-9]\d{0,9}$/

  # 1-15 digits > 0
  validates_format_of :isa06,
                      :allow_nil => true,
                      :with => /^[1-9]\d{0,14}$/
  validates_format_of :isa08,
                      :allow_nil => true,
                      :with => /^[1-9]\d{0,14}$/

  # 1-6 digits > 0
  validates_format_of :isa09,
                      :allow_nil => true,
                      :with => /^[1-9]\d{0,5}$/

  # 1-4 digits > 0
  validates_format_of :isa10,
                      :allow_nil => true,
                      :with => /^[1-9]\d{0,3}$/

  # 1-5 digits > 0
  validates_format_of :isa12,
                      :allow_nil => true,
                      :with => /^[1-9]\d{0,4}$/

  # 1-9 digits > 0
  validates_format_of :isa13,
                      :allow_nil => true,
                      :with => /^[1-9]\d{0,8}$/

  # 1 digit only > 0
  validates_format_of :isa11,
                      :allow_nil => true,
                      :with => /^[1-9]$/
  validates_format_of :isa14,
                      :allow_nil => true,
                      :with => /^[1-9]$/
  validates_format_of :isa15,
                      :allow_nil => true,
                      :with => /^[1-9]$/
  validates_format_of :isa16,
                      :allow_nil => true,
                      :with => /^[1-9]$/


# ------------------
# Length validations
# ------------------

#  validates_length_of   :isa01,    :maximum => 2
#  validates_length_of   :isa02,    :maximum => 10
#  validates_length_of   :isa03,    :maximum => 2,    :allow_blank => true
#  validates_length_of   :isa04,    :maximum => 10,   :allow_blank => true
#  validates_length_of   :isa05,    :maximum => 2,    :allow_blank => true
#  validates_length_of   :isa06,    :maximum => 15,   :allow_blank => true
#  validates_length_of   :isa07,    :maximum => 2,    :allow_blank => true
#  validates_length_of   :isa08,    :maximum => 15,   :allow_blank => true
#  validates_length_of   :isa09,    :maximum => 6,    :allow_blank => true
#  validates_length_of   :isa10,    :maximum => 4,    :allow_blank => true
#  validates_length_of   :isa11,    :maximum => 1,    :allow_blank => true
#  validates_length_of   :isa12,    :maximum => 5,    :allow_blank => true
#  validates_length_of   :isa13,    :maximum => 9,    :allow_blank => true
#  validates_length_of   :isa14,    :maximum => 1,    :allow_blank => true
#  validates_length_of   :isa15,    :maximum => 1,    :allow_blank => true
#  validates_length_of   :isa16,    :maximum => 1,    :allow_blank => true



# --------------------
# Presence validations
# --------------------

  validates_presence_of :isa01,  :isa02

#-------------------
# End of model class
#-------------------
end

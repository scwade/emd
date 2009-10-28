class Condition < ActiveRecord::Base

### Model Table relationships - many to many
  has_many :patient_conditions
  has_many :patient_profiles, :through => :patient_conditions

### SCW Performance enhancement - Use later
#  has_many :patient_profiles, :through => :patient_conditions, :select => "distinct patient_profiles.*"

  def self.find_my_condition
    find(:all, :order => "name")
  end

# ------------------
# Format validations
# ------------------

#  validates_format_of :google_url,
#                      :unless => Proc.new { |c| c.google_url.blank? },
#                      :with => /^https:\/\/health\.google\.com\/health\/ref(.)*/

#  validates_format_of :wiki_url,
#                      :unless => Proc.new { |c| c.wiki_url.blank? },
#                      :with => /@"((https?|ftp|gopher|telnet|file|notes|ms-help):((//)|(\\\\))+[\w\d:#@%/;$()~_?\+-=\\\.&]*)"/

# ------------------
# Length validations
# ------------------

  validates_length_of :name,  :maximum => 255

# ----------------------
# Uniqueness validations
# ----------------------

  validates_uniqueness_of :name,
                          :case_sensitive => :false,
                          :message => "not unique, already used by different patient"


#-------------------
# End of model class
#-------------------

end

### Validations
#  validates_uniqueness_of :xxx
#  validates_associated :condition.name
#  Validation not currently applicable
#  validate :fieled_must_be_higher_than_zero
#  validates_uniqueness_of :isa01

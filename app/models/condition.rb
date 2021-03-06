class Condition < ActiveRecord::Base

# ------------------------------
# All Methods are private scope
# ------------------------------
  private

# --------------------------------------------------------
# Table Relationships - let the framework manage the SQL
# --------------------------------------------------------

### Model Table relationships - many to many
  has_many :patient_conditions
  has_many :patient_profiles, :through => :patient_conditions

### SCW Performance enhancement - Use later
#  has_many :patient_profiles, :through => :patient_conditions, :select => "distinct patient_profiles.*"

  def self.find_my_condition
    find(:all, :order => "name")
  end

# ----------
# Callbacks
# ----------
  before_validation CleanLeadingTrailingBlanks.new(:name)

# ---------------------------------------------------------
# Format validations
#   Check google_url   https://health.google.com/health/ref
#   Check wiki_url     http://wiki.answers.com
#
# Future: Add javascript to validate full URL's (ie 404 errors)
#
# --------------------------------------------------------
  validates_format_of :google_url,
                      :unless => Proc.new { |c| c.google_url.blank? },
                      :with => /^https:\/\/health\.google\.com\/health\/ref(.)*/

  validates_format_of :wiki_url,
                      :unless => Proc.new { |c| c.wiki_url.blank? },
                      :with => /^http:\/\/wiki\.answers\.com(.)*/

# ------------------
# Length validations
# ------------------
  validates_length_of :name,  :maximum => 255

# Presence_of validations
#-------------------------
  validates_presence_of :name,
                        :allow_blank => false

# -----------------------------------------------------------------------
# Uniqueness validations
# -----------------------------------------------------------------------
  validates_uniqueness_of :name,
                          :case_sensitive => false,
                          :allow_blank => false

#-------------------
# End of model class
#-------------------
end

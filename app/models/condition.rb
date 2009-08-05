class Condition < ActiveRecord::Base

### Model Table relationships - many to many
  has_many :patient_conditions
  has_many :patient_profiles, :through => :patient_conditions
### SCW Performance enhancement - Use later
#  has_many :patient_profiles, :through => :patient_conditions, :select => "distinct patient_profiles.*"
 

### Validations
#  validates_uniqueness_of :xxx
#  validates_associated :condition.name
#  Validation not currently applicable
#  validate :fieled_must_be_higher_than_zero
#  validates_uniqueness_of :isa01

  def self.find_my_condition
    find(:all, :order => "name")
  end

end

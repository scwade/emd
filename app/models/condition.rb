class Condition < ActiveRecord::Base
  belongs_to :patient_conditions

  def self.find_my_condition
    find(:all, :order => "name")
  end
  
#  Validation not currently applicable
#  validate :fieled_must_be_higher_than_zero
#  validates_uniqueness_of :isa01


end

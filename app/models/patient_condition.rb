class PatientCondition < ActiveRecord::Base
  has_many :conditions
  # has_many :patient_profiles
  
  def self.find_my_condition
    find(:all, :order => "condition_name")
  end
end

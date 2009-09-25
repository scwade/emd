class PatientCondition < ActiveRecord::Base

#  has_and_belongs_to_many :conditions
  belongs_to :patient_profile
  belongs_to :condition

# SCW - Begin - Getter method
  def condition_label  
    condition_label if condition
  end
  
# SCW - Begin - Setter method
  def condition_name=(label)
    self.condition = Condition.find_by_name(label) unless label.blank?
  end

  def self.find_my_condition
    find(:all, :order => "condition_name")
  end
end

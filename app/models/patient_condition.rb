class PatientCondition < ActiveRecord::Base

  # Plugins
  acts_as_audited
  acts_as_authorization_object

  private

  # has_and_belongs_to_many :conditions
  belongs_to :patient_profile
  belongs_to :condition

  def condition_label  
    condition_label if condition
  end
  
  def condition_name=(label)
    self.condition = Condition.find_by_name(label) unless label.blank?
  end

  def find_my_condition
    find(:all, :order => "condition_name")
  end

  before_validation CleanLeadingTrailingBlanks.new(:treated_by, :treat_notes)
  before_save :validate

  # Note :start_date <= :end_date 
  def validate
    if start_date.blank?                then errors.add(:start_date, "is an invalid date.")
       elsif end_date.blank?            then errors.add(:end_date, "is an invalid date.")
       elsif start_date > self.end_date then errors.add(:start_date, "must be greater than or equal to end date.")
       elsif start_date > Date.today    then errors.add(:start_date, "must be less than or equal to todays date.")
       elsif end_date > Date.today      then errors.add(:end_date, "must be less than or equal to todays date.")
    end
  end

  validates_length_of  :treated_by,   :maximum => 255,  :allow_blank => true
  validates_length_of  :treat_notes,  :maximum => 255,  :allow_blank => true

  validates_presence_of :patient_profile_id, :condition_id
end

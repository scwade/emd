class PatientCondition < ActiveRecord::Base

# ------------------------------
# All Methods are private scope
# ------------------------------

  private

# --------------------------------------------------------
# Table Relationships - let the framework manage the SQL
# --------------------------------------------------------

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

# ----------
# Callbacks
# ----------

  before_validation CleanLeadingTrailingBlanks.new(:treated_by, :treat_notes)
  before_save :validate

# ------------------------------
# Note :start_date <= :end_date 
# ------------------------------

 def validate
    if self.start_date.blank?                then errors.add(:start_date, "is an invalid date.")
       elsif self.end_date.blank?            then errors.add(:end_date, "is an invalid date.")
       elsif self.start_date > self.end_date then errors.add(:start_date, "must be greater than or equal to end date.")
       elsif self.start_date > Date.today    then errors.add(:start_date, "must be less than or equal to todays date.")
       elsif self.end_date > Date.today      then errors.add(:end_date, "must be less than or equal to todays date.")
    end
  end


# ------------------
# Length validations
# ------------------

  validates_length_of   :treated_by,   :maximum => 255,  :allow_blank => true
  validates_length_of   :treat_notes,  :maximum => 255,  :allow_blank => true

# --------------------
# Presence validations
# --------------------

  validates_presence_of :patient_profile_id, :condition_id

# ------------------------
# End of Patient Condition
# ------------------------
end

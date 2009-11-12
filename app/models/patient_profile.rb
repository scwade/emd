class PatientProfile < ActiveRecord::Base

# --------
# Plugins
# --------
  acts_as_audited

# ------------------------------
# All Methods are private scope
# ------------------------------
  private

# --------------------------------------------------------
# Table Relationships - let the framework manage the SQL
# --------------------------------------------------------
### Model Table relationships - many to many
  has_many :patient_conditions
  has_many :conditions, :through => :patient_conditions

### SCW Performance enhancement - Use later
#  has_many :patient_profiles, :through => :patient_conditions, :select => "distinct patient_profiles.*"
 
# ----------
# Callbacks
# ----------
  before_validation CleanLeadingTrailingBlanks.new(:first_name, :last_name, :primary_address, :alternate_address, :city, :state_province) 
   before_update :help

  def help
    if current_user
      self.first_name = current_user.username
      self.last_name = current_user.id 
    end
  end

# ---------------------------
# From plugin - Date validation
# ----------------------------
  validates_date :date_of_birth, 
                 :before => Time.now.strftime("%d %b %y"), 
                 :after => '1 Jan 1900'

#-------------------------
# Confirmation validations
#-------------------------
  validates_confirmation_of :email,
                            :unless => Proc.new { |p| p.email.blank? },
                            :message => "verification failed, please re-type email address's"

# ------------------
# Format validations
# ------------------
  validates_format_of :state_province,
                      :unless => Proc.new { |p| p.state_province.blank? },
                      :with => /^[A-Z]+$/

  validates_format_of :zip5,
                      :unless => Proc.new { |p| p.zip5.blank? },
                      :with => /^\d{4,5}$/

  validates_format_of :zip4,
                      :unless => Proc.new { |p| p.zip4.blank? },
                      :with => /^\d{4}$/
  
  validates_format_of :email,
                      :message => "use format like name@proficientmd.com",
                      :with => /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i
  
  validates_format_of :phone_home,
                      :unless => Proc.new { |p| p.phone_home.blank? },
                      :with => /\d{10}$/

  validates_format_of :phone_mobile,
                      :unless => Proc.new { |p| p.phone_mobile.blank? },
                      :with => /\d{10}$/

  validates_format_of :phone_work,
                      :unless => Proc.new { |p| p.phone_work.blank? },
                      :with => /\d{10}$/

  validates_format_of :phone_fax,
                      :unless => Proc.new { |p| p.phone_fax.blank? },
                      :with => /\d{10}$/

  validates_format_of :phone_emergency,
                      :unless => Proc.new { |p| p.phone_emergency.blank? },
                      :with => /\d{10}$/

# ---------------------
# Inclusion validations
# ---------------------
  validates_inclusion_of :gender,
                       :in => %w{ M F }

# ------------------
# Length validations
# ------------------
  validates_length_of   :first_name,         :maximum => 255                              
  validates_length_of   :last_name,          :maximum => 255                              
  validates_length_of   :primary_address,    :maximum => 255,    :allow_blank => true     
  validates_length_of   :alternate_address,  :maximum => 255,    :allow_blank => true     
  validates_length_of   :city,               :maximum => 60,     :allow_blank => true                                        
  validates_length_of   :state_province,     :is => 2,           :allow_blank => true                                     
  validates_length_of   :ethnicity,          :maximum => 60

# ---------------------
# Numeric validations
# ---------------------
  validates_numericality_of :pmd_patient_id, :pmd_user_id, :physician_id

# --------------------
# Presence validations
# --------------------
  validates_presence_of :physician_id, :first_name, :last_name, :date_of_birth, :gender, :ethnicity
                        
# ----------------------
# Uniqueness validations
# ----------------------
  validates_uniqueness_of :pmd_patient_id, :pmd_user_id, :email,
                          :case_sensitive => false,
                          :message => "not unique, already used by different patient"
                          
#-------------------
# End of model class
#-------------------
end

class User < ActiveRecord::Base
  ROLES = %w(:admin :patient :doctor :clerk).freeze
  validates_presence_of :username, :email
  
  belongs_to :creator, :class_name => "User"
  attr_protected :creator
  
#  has_many :roles_users
#  has_many :roles, :through => :roles_users
#  has_many :patient_conditions
#  has_many :conditions, :through => :patient_conditions
  
  ### Set configuraiton options for authenticate library
  acts_as_authentic do |c|
    c.openid_required_fields = [:nickname, :email]
    c.logged_in_timeout = 60.minutes # default is 10.minutes
  end
  ### Enable/Configure acl9 to enable group level authorization
  acts_as_authorization_subject
    
  ### TODO(Rolland)-update comments and example: To make 'acts_as_audied' confirgurations changes place lines below
  #   acts_as_authentic do |option|
  #     option.require_password_confirmation(true)
  #   end

  ### Begin to define roles
  def role
    ROLES.detect { |role| self.has_role?(role) }
  end

  ### 
#  def admin?
#    !!(role =~ /admin/)
#  end

  ### Method used to email reset password request by user
  def deliver_password_reset_instructions!
    reset_perishable_token!
    Notifier.deliver_password_reset_instructions(self)
  end

  private
  
  ### Overide authlogic map_openid_registration - to pull back email and nickname
  def map_openid_registration(registration)
    self.email = registration["email"] if email.blank?
    self.username = registration["nickname"] if username.blank?
  end

end

class User < ActiveRecord::Base

  ### Temporary ROLES constant.  Method needs to be replaced with roles_user lookup procedure
  ROLES = %w(:admin :patient :doctor :clerk).freeze
  validates_presence_of :username, :email
  
  ###  SCW - TODO.  We may want to link table relationships. Need to see after testing
  #  has_many :roles_users
  #  has_many :roles, :through => :roles_users
  #  has_many :patient_conditions
  #  has_many :conditions, :through => :patient_conditions

  ### Sets creator of User (owner). Need to determine if concept of owner should be applied to other models.  TBD
  belongs_to :creator, :class_name => "User"
  attr_protected :creator
  
  ### Set configuraiton options for authenticate library
  acts_as_authentic do |c|
    c.openid_required_fields = [:nickname, :email]
    c.logged_in_timeout = 60.minutes # default is 10.minutes
  end

  ### Enable/Configure acl9 to enable group level authorization
  acts_as_authorization_subject
    
  ### Don't audit these fields (due to use with acts_as_authentic)
  acts_as_audited :except => [
    :crypted_password, 
    :persistence_token,
    :single_access_token,
    :perishable_token,
    :last_request_at,
  ]

  ### TODO(Rolland)-update comments and example: To make 'acts_as_audied' confirgurations changes place lines below
  #   acts_as_authentic do |option|
  #     option.require_password_confirmation(true)
  #   end

  ### Collect rols and evaluate if we have a role
  def role
    ROLES.detect { |role| self.has_role?(role) }
  end

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

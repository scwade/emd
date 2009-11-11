class User < ActiveRecord::Base
  acts_as_authentic do |c|
    c.openid_required_fields = [:nickname, :email]
  end

  ###  To make 'acts_as_audied' confirgurations changes place lines below
  #   acts_as_authentic do |option|
  #     option.require_password_confirmation(true)
  #   end

  private
  
  ### Overide authlogic map_openid_registration - to pull back email and nickname
  def map_openid_registration(registration)
    self.email = registration["email"] if email.blank?
    self.username = registration["nickname"] if username.blank?
  end

  def deliver_password_reset_instructions!
    reset_perishable_token!
    Notifier.deliver_password_reset_instructions(self)
  end
end

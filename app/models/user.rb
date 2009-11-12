class User < ActiveRecord::Base

  # When used with authentic do this
  acts_as_audited :except => [
    :crypted_password, 
    :persistence_token,
    :single_access_token,
    :perishable_token,
    :last_request_at,
  ]

  acts_as_authentic

#  To make confirgurations changes
#   acts_as_authentic do |option|
#     option.require_password_confirmation(true)
#   end
end

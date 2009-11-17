class User < ActiveRecord::Base

  # When used with acts_as_authentic do this
  acts_as_audited :except => [
    :crypted_password, 
    :persistence_token,
    :single_access_token,
    :perishable_token,
    :last_request_at,
  ]

  # Plugin
  acts_as_authentic 

end

class User < ActiveRecord::Base
#  acts_as_audited
   acts_as_authentic

#  To make confirgurations changes
#   acts_as_authentic do |option|
#     option.require_password_confirmation(true)
#   end
end

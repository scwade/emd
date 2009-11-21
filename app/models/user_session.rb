class UserSession < Authlogic::Session::Base
  logout_on_timeout true # enable session defalut logout (default if false)
end

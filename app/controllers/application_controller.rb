# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details
# SCW - Adding method for user linking to subset of conditions (my records, my conditions) 
#  def find_record
#    unless session[:record]         # if there is no record in session
#      session[:record] = Record.new # then add a new one
#    end
#    session[:record]
#  end

# SCW - section 11.4 - layout - not sure its working
#  layout "editransaction"

##### SCW - Uncomment to enable secure login
#  before_filter :authorize, :except => :login
  
  # See ActionController::Base for details
  # Uncomment this to filter the contents of submitted sensitive data parameters
  # from your application log (in this case, all fields with names like "password").
  filter_parameter_logging :password, :password_confirmation
  helper_method :current_user

  private

  def current_user_session
    return @current_user_session if defined?(@current_user_session)
    @current_user_session = UserSession.find
  end

  def current_user
    return @current_user if defined?(@current_user)
    @current_user = current_user_session && current_user_session.record
  end
end

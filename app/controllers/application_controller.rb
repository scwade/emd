# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base

# SCW - Adding method for user linking to subset of conditions (my records, my conditions) 
#  def find_record
#    unless session[:record]         # if there is no record in session
#      session[:record] = Record.new # then add a new one
#    end
#    session[:record]
#  end

# SCW - section 11.4 - layout - not sure its working
  layout "editransaction"

  ##### SCW - Uncomment to enable secure login
#  before_filter :authorize, :except => :login

  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details
  # SCW TODO - Scrub sensitive parameters from your log
  # filter_parameter_logging :password
  protected
  def authorize
    unless User.find_by_id(session[:user_id])
      flash[:notice] = "Please log in"
      redirect_to :controller => 'admin', :action => 'login'
    end
  end
end

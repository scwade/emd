### Filters added to this controller apply to all controllers in the application.
### Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base

  ### Add this line to elegantly handle access denial
  rescue_from 'Acl9::AccessDenied', :with => :access_denied
  
  helper :all # include all helpers, all the time

  ### See ActionController::RequestForgeryProtection for details
  ### Uncomment the :secret if you're not using the cookie session store
  protect_from_forgery # :secret => '1c6897ca751fffeb8e1be8d234aa6896'
 
  ### Filter Out Sensitive Data from Logs 
  # Uncomment to filter the contents of sensitive data parameters
  # Such as your application log (in this case, all fields with names like "password").
  filter_parameter_logging :password, :password_confirmation
  helper_method :current_user, :current_user_session
  
  protected

  def current_user_session
    return @current_user_session if defined?(@current_user_session)
    @current_user_session = UserSession.find
  end

  def current_user
    return @current_user if defined?(@current_user)
    @current_user = current_user_session && current_user_session.record
#    @current_user = current_user_session && current_user_session.user
  end
  
  def require_user
    unless current_user
      store_location
      flash[:yield] = "You must be logged in to access this page"
      redirect_to new_user_session_url
      return false
    end
  end

  def require_no_user
    if current_user
      store_location
      flash[:yield] = "You must be logged out to access this page"
      redirect_to user_url
      return false
    end
  end
  
  def store_location
    session[:return_to] = request.request_uri
  end
  
  def redirect_back_or_default(default)
    redirect_to(session[:return_to] || default)
    session[:return_to] = nil
  end

#  private
      
  def access_denied
    ### SCW - TODO - make this a subpage of the system and handle more elegantly
    #def access_denied
    if current_user
      #render :template => 'home/access_denied'
      render :file => File.join(RAILS_ROOT, 'public', '403.html'), :status => 403
    else
      flash[:yield] = 'Access denied. Try to log in first.'
      redirect_to login_path
    end
  end

end

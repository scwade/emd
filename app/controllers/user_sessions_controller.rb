class UserSessionsController < ApplicationController
  ### Begin acl9 configuration to use user and roles for User class
  before_filter :require_no_user, :only => [:new, :create]
  before_filter :require_user, :only => :destroy

  def new
    @user_session = UserSession.new
  end
  
  def create
    @user_session = UserSession.new(params[:user_session])
    ###Add block to handle openid handoff for authenticationl
    @user_session.save do |result|
      if result
        flash[:notice] = "Successfully logged in."
        ###redirect_to root_url
        redirect_to(:patient_profiles)
      else
        render :action => 'new'
      end
    end
  end
  
  def destroy
    @user_session = UserSession.find
    @user_session.destroy
    flash[:notice] = "Successfully logged out."
    redirect_to(root_url)
  end
end
 

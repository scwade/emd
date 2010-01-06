class UsersController < ApplicationController

  ### Acl9 - BEGIN configuration to use user and roles for User class
#  before_filter :require_user                                         # Require user to login
#  before_filter :set_allowed_roles                                    # Finds all user's roles; hold it in hash @allowed_roles
#  before_filter :load_user, :except => [:index, :new, :create]        # 
#  before_filter :allow_to_edit?, :only => [:edit, :update, :destroy]
#  before_filter :get_role, :only =>  [:create, :update]

#  access_control do
#    allow :all
#    allow :admin
#    allow :doctor
#  end
  ### Acl9 - END configuration
  
  
  # GET /users
  # GET /users.xml
  def index
    @users = User.all(:order => :username)
        respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @users }
    end
  end

  # GET /users/1
  # GET /users/1.xml
  def show
    @user = User.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @user }
    end
  end

  # GET /users/new
  # GET /users/new.xml
  def new
    @user = User.new
    
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @user }
    end
  end

  # GET /users/current/edit
  ####### SCW - PERFORMANCE - THINK THROUGH THE EDIT PROFILE AND EDIT USER Implementations.
  #def edit_self
  #    @user = current_user
  #end

  # GET /users/1/edit       
  def edit
      @user = User.find(params[:id])
  end

  # POST /users
  # POST /users.xml
  def create
    @user = User.new(params[:user])
    ### Add the creator of the object (in this case User) into our record
    @user.creator = current_user
    ### Save the user roles when saving the user
    #@user.save do |result|
    @user.save && check_and_set_role do |result|
      respond_to do |format|
        if result
          flash[:notice] = "User #{@user.username} was successfully registered."
#          @user.has_role!(:patient) # Add default group for user
          format.html { redirect_to(@user) } #      redirect_to root_url
          format.xml  { render :xml => @user, :status => :created, :location => @user }
        else
          format.html { render :action => "new" }
          format.xml  { render :xml => @user.errors, :status => :unprocessable_entity }
        end
      end
    end
  end

  # PUT /users/1
  # PUT /users/1.xml
  def update
    @user = User.find(params[:id])
    #@user = current_user
    ### Save the user roles when saving the user
    #@user.attributes = params[:user]
    check_and_set_role && @user.attributes = params[:user]
    @user.save do |result|
      respond_to do |format|
        if result
          flash[:notice] = "User #{@user.username} profile was successfully updated."
          format.html { redirect_to(@user) } 
          format.xml  { head :ok }
        else
          format.html { render :action => "edit" }
          format.xml  { render :xml => @user.errors, :status => :unprocessable_entity }
        end
      end
    end
  end
  # DELETE /users/1
  # DELETE /users/1.xml
  def destroy
    @user = User.find(params[:id])
    #SCW original    @user.destroy
    #SCWa - begin
    begin
      @user.destroy
      flash[:notice] = "User #{@user.username} deleted"
    rescue Exception => e
      flash[:yield] = e.message
    end
    #SCWa - end
    
    respond_to do |format|
      format.html { redirect_to(users_url) }
      format.xml  { head :ok }
    end
  end

  private

  def set_allowed_roles   #SCW - Work In Process (WIP)
    if current_user.has_role?(:admin)
      @allowed_roles = User::ROLES
    elsif current_user.has_role?(:doctor)
      %w(:doctor)
    else
      ### They Should Not Be Here -- TODO
      []
    end
  end

  def origin_set_allowed_roles
    @allowed_roles = if current_user.has_role?(:admin)
                      User::ROLES
                    elsif current_user.has_role?(:partner)
                      %w(partner_1 partner_2)
                    else
                      # WTF
                      []
                    end
  end

  def check_and_set_role
    return true if @user == current_user

    if @allowed_roles.include?(@role)
      @user.has_no_roles!
      @user.has_role!(@role)

      true
    else
      @user.errors.add(:base, 'You cannot assign this role to this user')

      false
    end
  end

  def load_user
    @user = User.find(params[:id])
  end

  def get_role
    @role = params[:user].delete('role')
  end

  def allow_to_edit?
    return if @user == current_user

    unless @allowed_roles.include?(@user.role) && @user.creator == current_user
        flash[:notice] = "You cannot edit this user!"
        redirect_to users_path
    end
  end
end

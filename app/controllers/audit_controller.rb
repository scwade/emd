class AuditController < ApplicationController

  # GET /audit
  # GET /audit.xml
  def index
    @audit = Audit.find(:all, :order => "id DESC")
    @user  = User.find(:all, :order => "id DESC")
   
    # Show username from User table 
    show_username 

    respond_to do |format|
      format.html # index.html.erb
      format.xml { render :xml => @audits }
    end
  end

  # SHOW /audit/1
  # SHOW /audit/1.xml
  def show
    @audit = Audit.find(params[:id])
    unless @audit.user_id.blank?
      @audit.username = @audit.user.username

      if @audit.auditable_type == "PatientCondtion"
        x = PatientCondtion.find(@audit.auditable_id).patient_profile_id
        @name = PatientProfile.find(x).first_name
      elsif @audit.auditable_type == "PatientProfile"
        @name = PatientProfile.find(@audit.auditable_id).first_name
      elsif @audit.auditable_type == "User"
        @name = @audit.user.username
      end

      @audit[:patient] = @name

    else
      @audit[:patient] = "n/a"
    end
    
    respond_to do |format|
      format.html # show.html.erb
      format.xml { render :xml => @audits }
    end
  end

  # SHOW_FILTER /audit/1
  # SHOW_FILTER /audit/1.xml
  def show_filter
    @audit = Audit.find(:all, :conditions => [ "user_id = ? OR username = ?", params[:user_id], params[:username]], :order => "id DESC")
    show_username
    
    respond_to do |format|
      format.html # show_filter.html.erb 
      format.xml { render :xml => @audits }
    end
  end

  # DELETE /audit/1
  # DELETE /audit/1.xml
  def destroy
    @audit = Audit.find(params[:id])
    @audit.destroy

    respond_to do |format|
      if @audit.destroy
        flash[:notice] = 'Audit was successfully deleted.'
      end
      format.html { redirect_to(audit_index_url) }
      format.xml  { head :ok }
    end
  end

  protected

  # By design, the plugin "acts_as_audit" model attribute "username" is not populated for applications that implement
  # a User model. Use the Audit models attribute "user_id" to obtain "username" from User model.
  def show_username   
    unless @audit.blank?
      @audit.each do |t|
        unless t.user_id.blank?
          t.username ||= User.find_by_id(t.user_id).username
        else
          t.username = "No user logged in"
        end
      end
    end
  end

end

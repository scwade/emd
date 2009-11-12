class AuditController < ApplicationController

  # GET /audit
  # GET /audit.xml
  def index
    @audit = Audit.find(:all, :order => :id)

    # Temp fix for no username in audit table
    unless @audit.blank?
      @audit.each do |t|
        unless t.user_id.blank?
          t.username ||= User.find_by_id(t.user_id).username
        else
          t.username = "No user logged in"
        end
      end
    end     

    respond_to do |format|
      format.html # index.html.erb
      format.xml { render :xml => @audits }
    end
  end

  def show
    flash[:yield] = "Not implemented yet"
    redirect_to(audit_index_url)
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

end

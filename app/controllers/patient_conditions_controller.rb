class PatientConditionsController < ApplicationController
  # GET /patient_conditions
  # GET /patient_conditions.xml
  def index
    @patient_conditions = PatientCondition.all
    @conditions = Condition.find(:all)
    @patient_profiles = PatientProfile.find(:all)
    
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @patient_conditions }
    end
  end

  # GET /patient_conditions/list
  def list
    @patient_conditions = PatientCondition.all
    @conditions = Condition.find(:all)
    @patient_profiles = PatientProfile.find(:all)
    
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @patient_conditions }
    end
  end


  # GET /patient_conditions/1
  # GET /patient_conditions/1.xml
  def find_condition_name(id)
    @conditions = Condition.find(:all)
    @patient_profiles = PatientProfile.find(:all)
    Condition.find(:all, :order => "name")

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @patient_condition }
    end
  end

  # GET /patient_conditions/1
  # GET /patient_conditions/1.xml
  def show
    @patient_condition = PatientCondition.find(params[:id])
    
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @patient_condition }
    end
  end

  # GET //////patient_conditions/1
  # GET //////patient_conditions/1.xml
  def show_condition_name
    @patient_condition = PatientCondition.find(params[:id], :include => [:conditions])
#    @conditions = @patient_condition.conditions
    
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @patient_condition }
    end
  end
  
  
  # GET /patient_conditions/new
  # GET /patient_conditions/new.xml
  def new
    @patient_condition = PatientCondition.new
    @conditions = Condition.find(:all)
    @patient_profiles = PatientProfile.find(:all)
    
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @patient_condition }
    end
  end

  # GET /patient_conditions/1/edit
  def edit
    @patient_condition = PatientCondition.find(params[:id])
    @conditions = PatientCondition.find(:all)
    @patient_profiles = PatientProfile.find(:all)
  end

  # POST /patient_conditions
  # POST /patient_conditions.xml
  def create
    @patient_condition = PatientCondition.new(params[:patient_condition])
    respond_to do |format|
      if @patient_condition.save
        flash[:notice] = 'Patient Condition was successfully created.'
        format.html { redirect_to(@patient_condition) }
        format.xml  { render :xml => @patient_condition, :status => :created, :location => @patient_condition }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @patient_condition.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /patient_conditions/1
  # PUT /patient_conditions/1.xml
  def update
    @patient_condition = PatientCondition.find(params[:id])

    respond_to do |format|
      if @patient_condition.update_attributes(params[:patient_condition])
        flash[:notice] = 'Patient Condition was successfully updated.'
        format.html { redirect_to(@patient_condition) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @patient_condition.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /patient_conditions/1
  # DELETE /patient_conditions/1.xml
  def destroy
    @patient_condition = PatientCondition.find(params[:id])
    @patient_condition.destroy

    respond_to do |format|
      if @patient_condition.destroy
        flash[:notice] = 'Patient Condition was successfully deleted.'
      end
      format.html { redirect_to(patient_conditions_url) }
      format.xml  { head :ok }
    end
  end
end

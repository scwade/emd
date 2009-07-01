class MyRecordController < ApplicationController

# SCW - BEGIN - debug
#  def new 
#    debugger 
#    @myrecords = MyRecords.new 
#  end
# SCW - END - Debug

  def index
  # Get access to condition hash and partial of _record
    @conditions = Condition.find_my_condition
    @record = find_record
  # Get access to patientcondition hash 
    @patient_conditions = PatientCondition.find_my_condition
  end
  
  def redirect_to_index(msg = nil)
  flash[:notice] = msg if msg
  redirect_to :action => 'index'
  end

  def add_to_record
#  SCW - BEGIN - END debugger inserted
#  debugger
    anycondition = Condition.find(params[:id])     # <label id="code.emd.f.find"/>
    @record = find_record                       # <label id="code.emd.f.find2"/>
    @record.add_condition(anycondition)            # <label id="code.emd.f.add"/>
#    redirect_to_index                   #enable when Ajax only is desired

  rescue ActiveRecord::RecordNotFound
    logger.error("Attempt to access invalid records #{params[:id]}" )
    redirect_to_index("Invalid record")
  end

  def clear_record
    session[:record] = nil
    redirect_to_index("You have no pending records")
  end
  
  
  private
  def find_record  
    session[:record] ||= Record.new
  end
  
  def redirect_to_index(msg)
    flash[:notice] = msg
    redirect_to :action => 'index'
  end
   

end

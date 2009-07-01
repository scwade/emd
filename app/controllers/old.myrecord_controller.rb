class MyRecordController < ApplicationController

# SCW - debug
#  def new debugger 
#    @debugrecord = Myrecord.new 
#  end

  def index
    @conditions = Condition.find_my_conditions
  end

  def add_to_record
    anycondition = Condition.find(params[:id])     # <label id="code.emd.f.find"/>
    @record = find_record                       # <label id="code.emd.f.find2"/>
    @record.add_condition(anycondition)            # <label id="code.emd.f.add"/>
  end


  private
  def find_record  
    session[:record] ||= Record.new
  end
       

end

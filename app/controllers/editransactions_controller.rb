class EditransactionsController < ApplicationController
# SCWBEGIN
#	active_scaffold :editransaction
# SCWEND

  # GET /editransactions
  # GET /editransactions.xml
  def index
    @editransactions = Editransaction.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @editransactions }
    end
  end

  # GET /editransactions/1
  # GET /editransactions/1.xml
  def show
    @editransaction = Editransaction.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @editransaction }
    end
  end

  # GET /editransactions/new
  # GET /editransactions/new.xml
  def new
    @editransaction = Editransaction.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @editransaction }
    end
  end

  # GET /editransactions/1/edit
  def edit
    @editransaction = Editransaction.find(params[:id])
  end

  # POST /editransactions
  # POST /editransactions.xml
  def create
    @editransaction = Editransaction.new(params[:editransaction])

    respond_to do |format|
      if @editransaction.save
        flash[:notice] = 'Editransaction was successfully created.'
        format.html { redirect_to(@editransaction) }
        format.xml  { render :xml => @editransaction, :status => :created, :location => @editransaction }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @editransaction.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /editransactions/1
  # PUT /editransactions/1.xml
  def update
    @editransaction = Editransaction.find(params[:id])

    respond_to do |format|
      if @editransaction.update_attributes(params[:editransaction])
        flash[:notice] = 'Editransaction was successfully updated.'
        format.html { redirect_to(@editransaction) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @editransaction.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /editransactions/1
  # DELETE /editransactions/1.xml
  def destroy
    @editransaction = Editransaction.find(params[:id])
    @editransaction.destroy

    respond_to do |format|
      format.html { redirect_to(editransactions_url) }
      format.xml  { head :ok }
    end
  end
end

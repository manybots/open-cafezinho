class Admin::CoffeeTypesController < ApplicationController
  before_filter :admin_required
  
  def index
    @coffee_types = CoffeeType.find :all
   
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @coffee_types }
    end
  end
   
  def show
    @coffee_type = CoffeeType.find(params[:id])
   
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @coffee_type }
    end
  end
   
  def new
    @coffee_type = CoffeeType.new
   
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @coffee_type }
    end
  end
   
  def edit
    @coffee_type = CoffeeType.find(params[:id])
  end
   
  def create
    @coffee_type = CoffeeType.new(params[:coffee_type])
   
    respond_to do |format|
      if @coffee_type.save
        flash[:notice] = 'CoffeeType was successfully created.'
        format.html { redirect_to(admin_coffee_types_path) }
        format.xml  { render :xml => @coffee_type, :status => :created, :location => @coffee_type }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @coffee_type.errors, :status => :unprocessable_entity }
      end
    end
  end
   
  def update
    @coffee_type = CoffeeType.find(params[:id])
   
    respond_to do |format|
      if @coffee_type.update_attributes(params[:coffee_type])
        flash[:notice] = 'CoffeeType was successfully updated.'
        format.html { redirect_to(@coffee_type) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @coffee_type.errors, :status => :unprocessable_entity }
      end
    end
  end
   
  def destroy
    @coffee_type = CoffeeType.find(params[:id])
    @coffee_type.destroy
   
    respond_to do |format|
      format.html { redirect_to(admin_coffee_types_url) }
      format.xml  { head :ok }
    end
  end
end

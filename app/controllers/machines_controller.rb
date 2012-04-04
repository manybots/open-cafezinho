class MachinesController < ApplicationController
  before_filter :authenticate_user!, :except => [:drink_at]
  # GET /machines
  # GET /machines.json
  def index
    @machines = current_user.machines.where(:is_public => [false, nil]) + Machine.where(:is_public => true)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @machines }
    end
  end

  # GET /machines/1
  # GET /machines/1.json
  def show
    @machine = Machine.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @machine }
    end
  end
  
  def drink_at
    @machine = Machine.find_by_slug!(params[:slug])
    if current_user
      @brands = @machine.brand_id.present? ? Brand.where(:id => [@machine.brand_id]) : Brand.all
      @drink = current_user.drinks.new
      @drink.machine_id = @machine.id
      if params[:coffee_type_id].present?
        @drink.coffee_type_id = params[:coffee_type_id]
      end
    else
      session[:user_return_to] = drink_at_path(@machine.slug)
      render 'drink_at_public'
    end
  end
  
  # GET /machines/new
  # GET /machines/new.json
  def new
    @machine = current_user.machines.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @machine }
    end
  end

  # GET /machines/1/edit
  def edit
    @machine = current_user.machines.find(params[:id])
  end

  # POST /machines
  # POST /machines.json
  def create
    @machine = current_user.machines.new(params[:machine])

    respond_to do |format|
      if @machine.save
        format.html { redirect_to root_path, notice: 'Machine was successfully created.' }
        format.json { render json: @machine, status: :created, location: @machine }
      else
        format.html { render action: "new" }
        format.json { render json: @machine.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /machines/1
  # PUT /machines/1.json
  def update
    @machine = current_user.machines.find(params[:id])

    respond_to do |format|
      if @machine.update_attributes(params[:machine])
        format.html { redirect_to @machine, notice: 'Machine was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @machine.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /machines/1
  # DELETE /machines/1.json
  def destroy
    @machine = current_user.machines.find(params[:id])
    @machine.destroy

    respond_to do |format|
      format.html { redirect_to machines_url }
      format.json { head :ok }
    end
  end
end

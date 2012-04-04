class DrinksController < ApplicationController
  before_filter :authenticate_user!
  
  def index
    @drinks = current_user.drinks.order('created_at DESC')
   
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @drinks }
    end
  end
     
  def favorite
    @drink = current_user.drinks.find(params[:id])
    @fave = current_user.favorites.new
    @fave.drink_id = @drink.id
    @fave.save
    redirect_to drinks_path, :notice => "Added to favorites"
  end
  
  def unfavorite
    @fave = current_user.favorites.find_by_drink_id(params[:id])
    @fave.destroy
    redirect_to root_path, :notice => "Removed to favorites"
  end
         
  def create
    @drink = current_user.drinks.new(params[:drink])
   
    respond_to do |format|
      if @drink.save
        format.html { redirect_to(root_path, :notice => "Caffeine!") }
        format.xml  { render :xml => @drink, :status => :created, :location => @drink }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @drink.errors, :status => :unprocessable_entity }
      end
    end
  end
   
  def destroy
    @drink = current_user.drinks.find(params[:id])
    @drink.destroy
   
    respond_to do |format|
      format.html { redirect_to(drinks_url) }
      format.xml  { head :ok }
    end
  end
end

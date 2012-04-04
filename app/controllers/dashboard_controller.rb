class DashboardController < ApplicationController
  before_filter :authenticate_user!
  
  def index
    @drank_today = current_user.drinks.where('DATE(created_at) = ?', Date.today).order('created_at DESC').count
    @drank_7_days = current_user.drinks.where('DATE(created_at) >= ?', Date.today - 7.days).order('created_at DESC').count
    @drank_overall = current_user.drinks.count
    @favorite_drinks = current_user.favorites.includes(:drink).collect(&:drink)
    @machines = current_user.machines.where(:is_public => [false, nil]) + Machine.where(:is_public => true)
    @drinks = current_user.drinks.order('created_at DESC').limit(3)
  end
  
  def codebits
    @machines = Machine.where(:is_codebits => true)
    @drinks = @machines.collect(&:drinks).flatten
    @users = @drinks.collect(&:user_id)
    @top_users = User.where(:id => @users.uniq).collect{|u| {u => u.drinks.where(:machine_id => @machines.collect(&:id)).count} }.sort_by{|u| u.to_a.flatten.last }.reverse
    @top_machines = @machines.sort_by {|m| m.drinks.count }.reverse
  end
end

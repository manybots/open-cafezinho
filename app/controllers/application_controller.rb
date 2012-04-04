class ApplicationController < ActionController::Base
  protect_from_forgery
  
  def admin_required
    current_user.email_to_s == ADMIN_EMAIL_ADDRESS ? true : raise(ActiveRecord::RecordNotFound)
  end
  
end

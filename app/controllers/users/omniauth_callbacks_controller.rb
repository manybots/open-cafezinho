class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController

  def manybots
    # You need to implement the method below in your model
    @user = User.find_for_manybots_oauth(env["omniauth.auth"], current_user)

    if @user.persisted?
      flash[:notice] = I18n.t "devise.omniauth_callbacks.success", :kind => "Manybots"
      @user.remember_me = true
      sign_in_and_redirect @user, :event => :authentication
    else
      session["devise.manybots_data"] = env["omniauth.auth"]
      redirect_to new_user_registration_url
    end
  end
  
  def passthru
    render :file => "#{Rails.root}/public/404.html", :status => 404, :layout => false
  end
  
  def login
    unless current_user
      render
    else
      flash[:notice] = "You are already logged in."
      redirect_to root_path
    end
  end  
  
  def logout
    if current_user
      flash[:notice] = 'You were logged out.'
      current_user.forget_me!
      sign_out_and_redirect current_user
    else
      redirect_to root_path
    end
  end
  
end
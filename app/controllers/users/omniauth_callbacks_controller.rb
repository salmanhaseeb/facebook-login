class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def facebook
    @user = User.from_omniauth(request.env["omniauth.auth"], current_user)

    if @user.persisted?
      redirect_to welcome_posts_path, user: current_user
    else
      redirect_to root_path
      # session["devise.facebook_data"] = request.env["omniauth.auth"].except(:extra) # Removing extra as it can overflow some session stores
      # redirect_to new_user_registration_url
    end
  end

  def failure
    redirect_to root_path
  end
end
class OmniauthCallbacksController < Devise::OmniauthCallbacksController
  skip_before_filter :authenticate_user!

  def facebook
    facebook_data = request.env['omniauth.auth']

    @user = User.find_or_create_by_facebook_oauth(facebook_data)
    sign_in_and_redirect @user
  end
end
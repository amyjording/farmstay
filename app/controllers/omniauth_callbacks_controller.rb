class OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def facebook
    # You need to implement the method below in your model (e.g. app/models/user.rb)
    @farmie = Farmie.from_omniauth(request.env["omniauth.auth"])
    if @farmie.persisted?
      sign_in_and_redirect @farmie, event: :authentication #this will throw if @user is not activated
      set_flash_message(:notice, :success, kind: "Facebook") if is_navigational_format?
    else
      session["devise.facebook_data"] = request.env["omniauth.auth"]
      redirect_to new_farmie_registration_url
    end
  end

  def failure
    redirect_to root_path
  end

#  def twitter
    # You need to implement the method below in your model (e.g. app/models/user.rb)
#    @farmie = Farmie.from_omniauth(request.env["omniauth.auth"])

#    if @farmie.persisted?
#      sign_in_and_redirect @farmie, event: :authentication #this will throw if @user is not activated
#      set_flash_message(:notice, :success, kind: "Twitter") if is_navigational_format?
#    else
#      session["devise.twitter_data"] = request.env["omniauth.auth"]
#      redirect_to new_user_registration_url
#    end
#  end

end
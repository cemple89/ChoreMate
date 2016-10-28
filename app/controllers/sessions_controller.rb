class SessionsController < ApplicationController
  def create
    user = User.from_omniauth(env["omniauth.auth"])
    session[:user_id] = user.id
    if user.apartment_id.nil?
      redirect_to root_path
    else
      @apartment = Apartment.find(user.apartment_id)
      redirect_to apartment_path(@apartment)
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url
  end
end

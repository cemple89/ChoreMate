class UsersController < ApplicationController

  def create
    current_user = Usersfb.from_omniauth(request.env["omniauth.auth"])
    session[:user_id] = user.id
    redirect_to root_url
  end


  def update
    @user = current_user
    @user.chorescore += params[:chore_points].to_i
    @user.save

    render json: {
      completed: @user.chorescore,
      user_id: @user.id
    }
  end


  protected



end

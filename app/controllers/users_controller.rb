class UsersController < ApplicationController

  def create
    current_user = Usersfb.from_omniauth(request.env["omniauth.auth"])
    session[:user_id] = user.id
    redirect_to root_url
  end

  def edit
    @user = current_user
    @apartment = @user.apartment
    new_roommate = User.find(params[:email])
    new_roommate.apartment = @user.apartment
    new_roommate.save

    if new_roommate.save
      flash[:notice] = "Roommate successfully added!"
      redirect_to apartment_path(@apartment)
    else
      flash[:notice] = @user.errors.full_messages.join(", ")
    end
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

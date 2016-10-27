class UsersController < ApplicationController


  def update
    @user = User.find(4)
    @user.chorescore += params[:chore_points].to_i
    @user.save

    render json: {
      completed: @user.chorescore,
      user_id: @user.id
    }
  end


  protected



end

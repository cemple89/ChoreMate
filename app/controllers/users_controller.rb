class UsersController < ApplicationController


  def update
    @user = User.find(3)
    @user.chorescore += params[:chore_points].to_i
    @user.save
  end


  protected



end

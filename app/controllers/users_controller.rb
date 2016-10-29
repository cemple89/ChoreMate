class UsersController < ApplicationController


  def update
    @user = User.find(1)
    @user.chorescore += params[:chore_points].to_i
    @user.save

    render json: {
      completed: @user.chorescore,
      user_id: @user.id
    }
  end


  protected

  def user_params
    params.require(:user).permit(:name, :apartment_id, :chorescore, :provider, :uid, :oauth_token, :oauth_expires_at, :email, :admin)
  end

end

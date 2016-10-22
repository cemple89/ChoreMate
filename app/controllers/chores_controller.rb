require 'pry'
class ChoresController < ApplicationController

  def new
    @user = User.find(3)
    @apartment = @user.apartment
    @chore = Chore.new
    @points_collection = Chore::POINTS
  end

  def create
    @points_collection = Chore::POINTS
    @user = User.find(3)
    @apartment = @user.apartment
    @chore = Chore.new(chore_params)
    @chore.apartment = @apartment
    @chore.user = @user
    if @chore.save
      flash[:notice] = 'Chore added successfully'
      redirect_to root_path
    else
      flash[:notice] = @chore.errors.full_messages.join(", ")
      render :new
    end
  end

  def index
    @user = User.find(3)
    @apartment = @user.apartment
    @chores = Chore.find_by(apartment: @apartment)
    @users = @apartment.users
  end

  def edit
    @user = User.find(3)
    @apartment = @user.apartment
    @chore = Chore.find(params[:id])
    @chore.update_attributes(user_id: params[:user_id])
    @points_collection = Chore::POINTS
    render json: {
      message: "You now own this chore!",
      completed: @chore.user.name,
      chore_id: @chore.id
    }, status: :ok

  end

  def update
    @user = User.find(3)
  end

  def destroy
    @chore = Chore.find(params[:id])
  end



  protected

  def chore_params
    params.require(:chore).permit(:name, :completion_interval, :apartment_id, :points, :user_id, :id)
  end


end

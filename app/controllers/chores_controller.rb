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
    completion_interval = @chore.completion_interval.to_i
    currenttime = Time.now
    @chore.last_completed = currenttime
    @chore.due_by = currenttime + completion_interval.days
    @chore.save
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
    @chore.last_completed = Time.now
    @chore.due_by = @chore.last_completed + params[:completion_interval].to_i.days
    @points_collection = Chore::POINTS
    @new_due_by = @chore.due_by
    @chore.save
    render json: {
      message: "You now own this chore!",
      name: @chore.user.name,
      chore_id: @chore.id,
      last_completed: Time.now.localtime.strftime('%b %e'),
      due_by: @new_due_by.localtime.strftime('%b %e')

    }, status: :ok

  end

  def update
    @user = User.find(3)
  end

  def destroy
    @chore = Chore.find(params[:id])
    @chore.destroy
    render json: {
      message: "You have deleted this chore!",
      chore_id: @chore.id
    }, status: :ok
  end



  protected

  def chore_params
    params.require(:chore).permit(:name, :completion_interval, :apartment_id, :points, :due_by, :completed_by, :user_id)
  end


end

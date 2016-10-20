class ChoresController < ActionController::Base

  def new
    @user = User.find(1)
    @apartment = @user.apartment
    @chore = Chore.new
    @points_collection = Chore::POINTS
  end

  def create
    @points_collection = Chore::POINTS
    @user = User.find(1)
    @apartment = @user.apartment
    @chore = Chore.new(chore_params)
    @chore.apartment = @apartment
    if @chore.save
      flash[:notice] = 'Chore added successfully'
      redirect_to root_path
    else
      flash[:notice] = @chore.errors.full_messages.join(", ")
      render :new
    end
  end

  def index
    @user = User.find(1)
    @apartment = @user.apartment
    @chores = Chore.find_by(apartment: @apartment)
    @users = @apartment.users
  end

  def edit
    @user = User.find(1)
    @apartment = @user.apartment
    @chore = Chore.new(chore_params, apartment: @apartment)
    @points_collection = Chore::POINTS
  end


  protected

  def chore_params
    params.require(:chore).permit(:name, :completion_interval, :apartment_id, :points)
  end


end

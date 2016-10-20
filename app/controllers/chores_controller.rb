class ChoresController < ActionController::Base

  def new
    # @apartment = current_user.apartment
    @chore = Chore.new(chore_params, apartment: @apartment)
    @points_collection = Chore::POINTS
  end

  def create
    @apartment = current_user.apartment
    @chore = Chore.new(chore_params, apartment: @apartment)
    if @chore.save
      flash[:notice] = 'Chore added successfully'
      redirect_to apartment_path
    else
      flash[:notice] = @chore.errors.full_messages.join(", ")
      redirect_to apartment_path
  end

  def index
    @apartment = current_user.apartment
    @chores = Chore.find_by(apartment: @apartment)
    @users = @apartment.users
  end

  def edit
    @apartment = current_user.apartment
    @chore = Chore.new(chore_params, apartment: @apartment)
    @points_collection = Chore::POINTS
  end


  protected

  def chore_params
    params.require(:chore).permit(:name, :completion_interval, :apartment_id)
  end


end

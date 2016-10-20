class ChoresController < ActionController::Base

  def new
    @chores = Chore.new
  end

  def create
    @apartment = current_user.apartment
    @chore = Chore.new(chore_params, apartment: @apartment)
    if @chore.save
  end

  def index
    @apartment = current_user.apartment
    @chores = Chore.find_by(apartment: @apartment)
    @user = @apartment.users 
  end


  protected

  def chore_params
    params.require(:chore).permit(:name, :completion_interval, :apartment_id)
  end


end

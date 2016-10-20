class ApartmentsController < ActionController::Base

  def new
  end

  def create
  end

  def show
    @apartment = current_user.apartment
    @chores = Chore.find_by(apartment: @apartment)
    @users = @apartment.users
  end


  protected


end

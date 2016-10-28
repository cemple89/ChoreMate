class ApartmentsController < ApplicationController


  def index
    @user = current_user
  end

  def new
    @state_collection = Apartment::STATES
    @apartment = Apartment.new
  end

  def create
    @user = current_user
    @apartment = Apartment.new(apartment_params)
    @state_collection = Apartment::STATES

    if @apartment.save
      @user.apartment_id = @apartment.id
      @user.admin == true
      @user.save
      redirect_to apartment_path(@apartment)
      flash[:notice] = "Apartment created successfully"
    else
      flash[:notice] = @apartment.errors.full_messages.join(", ")
      render :new
    end
  end



  def show
    @user = current_user
    @apartment = Apartment.find(@user.apartment_id)
    if @apartment.chores
      @chores = @apartment.chores.order('due_by ASC')
    end
    @users = @apartment.users
  end


  protected

  def apartment_params
    params.require(:apartment).permit(:address, :city, :state, :zip_code)
  end


end

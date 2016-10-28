class ApartmentsController < ApplicationController

  def new
    @state_collection = Location::STATES
    @apartment = Apartment.new
  end

  def create
    @user = current_user
    @state_collection = Location::STATES
    @user.apartment = Apartment.find(params[:apartment_id])
    @user.admin
    @apartment = Apartment.new(apartment_params)

    if @apartment.save
      @user.save
      redirect_to apartment_path(@apartment)
      flash[:notice] = "Apartment created successfully"
    else
      flash[:notice] = @apartment.errors.full_messages.join(", ")
      render :new
    end
  end



  def show
    @user = User.find(4)
    @apartment = @user.apartment
    @chores = @apartment.chores.order('due_by ASC')
    @users = @apartment.users

  end


  protected


end

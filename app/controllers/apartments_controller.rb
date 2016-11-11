class ApartmentsController < ApplicationController

  def new
    @user = User.find(1)
    @apartment = Apartment.new
  end

  def create
    @user = User.find(1)
    @apartment = Apartment.new(apartment_params)
    if @apartment.save
      @user.apartment_id = @apartment.id
      @user.save
      @samplechore = Chore.new(name: "Sample Chore", completion_interval: 7,
      apartment_id: "#{@apartment.id}",
      points: 3, user_id: "#{@user.id}")
      completion_interval = @samplechore.completion_interval.to_i
      currenttime = Time.now
      @samplechore.last_completed = currenttime
      @samplechore.due_by = currenttime + completion_interval.days
      @samplechore.save!
      flash[:notice] = 'Welcome to your Apartment Chore Page'
      redirect_to apartment_path(@apartment)
    else
      flash[:notice] = @apartment.errors.full_messages.join(", ")
      render :new
    end
  end


  def show
    @user = User.find(1)
    @apartment = @user.apartment
    @chores =[]
    @chores << Chore.find_by_apartment_id(@apartment.id)
    @chores.sort! { |a,b| a.due_by <=> b.due_by }
    @users = @apartment.users
  end


  def index
    @user = User.find(1)
    @apartments = Apartment.all
  end

  protected

  def apartment_params
    params.require(:apartment).permit(:name, :zip_code, :secret)
  end


end

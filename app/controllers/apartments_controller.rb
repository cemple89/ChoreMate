class ApartmentsController < ApplicationController

  def new
    @state_collection = Location::STATES
  end

  def create
    @state_collection = Location::STATES
  end

  def show
    @user = User.find(4)
    @apartment = @user.apartment
    @chores = @apartment.chores.order('due_by ASC')
    @users = @apartment.users

  end


  protected


end

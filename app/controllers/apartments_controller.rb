class ApartmentsController < ApplicationController

  def new
  end

  def create
  end

  def show
    @user = User.find(1)
    @apartment = @user.apartment
    @chores = @apartment.chores.order('completion_interval ASC')
    @users = @apartment.users
  end


  protected


end

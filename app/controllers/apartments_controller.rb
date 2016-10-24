class ApartmentsController < ApplicationController

  def new
  end

  def create
  end

  def show
    @user = current_user
    @apartment = @user.apartment
    @chores = @apartment.chores.order('completion_interval ASC')
    @users = @apartment.users
  end


  protected


end

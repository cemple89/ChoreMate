class ApartmentsController < ApplicationController

  def new

  end

  def create
  end

  def show
    @user = User.find(3)
    @apartment = @user.apartment
    @chores = @apartment.chores.order('due_by ASC')
    @users = @apartment.users
  end


  protected


end

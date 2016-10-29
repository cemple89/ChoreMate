class ApartmentsController < ApplicationController


  def show
    @user = User.find(1)
    @apartment = @user.apartment
    @chores = @apartment.chores.order('due_by ASC')
    @users = @apartment.users

  end


  protected


end

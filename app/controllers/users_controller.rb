class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    if @user == current_user
      render :profile
    else
      render :show
    end
  end
end

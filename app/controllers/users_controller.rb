class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    if @user == current_user
      raise
    else
      render :show
    end
  end
end

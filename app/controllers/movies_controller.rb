class MoviesController < ApplicationController
  def index
    @circle = Circle.find(params[:circle_id])
    @user = current_user

  end

  def show
  end
end

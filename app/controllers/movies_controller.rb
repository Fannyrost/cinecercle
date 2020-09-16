class MoviesController < ApplicationController
  def index
    @circle = Circle.find(params[:circle_id])


  end

  def show
  end
end

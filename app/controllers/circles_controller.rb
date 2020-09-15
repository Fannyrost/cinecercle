class CirclesController < ApplicationController
  def index
    @circles = current_user.circles

  end

  def show
    @circle = Circle.find(params[:id])
  end
end

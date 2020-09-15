class CirclesController < ApplicationController
  def index
    @circles = current_user.circles
    # @user = current_user
    @circle = Circle.new
  end

  def show
    @circle = Circle.find(params[:id])
  end

  def create
    @circle = Circle.new(circle_params)
    @user = current_user
    @circle.user = @user
    if @circle.save
      redirect_to circle_path(@circle)
    else
      redirect_to circles_path ,notice: "Oops, merci de recommencer"
    end
  end

  def circle_params
    params.require(:circle).permit(:title, :description)
  end
end

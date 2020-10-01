class CirclesController < ApplicationController

  add_breadcrumb "Accueil ", :root_path
  add_breadcrumb " Mes cercles ", :circles_path
  # add_breadcrumb "Circles", :circles_path

  def index
    # add_breadcrumb "Mes cercles", :circles_path
    @circles = []
    current_user.memberships.each do |membership|
      @circles << membership.circle if membership.active
    end
    @circle = Circle.new
  end

  def show
    @circle = Circle.find(params[:id])
    add_breadcrumb "Cercle \" #{@circle.title} \"", :circle_path
    cookies[:circle] = @circle.id
    @membership = Membership.new


  end

  def create
    @circle = Circle.new(circle_params)
    @user = current_user
    @circle.user = @user
    if @circle.save
      m = Membership.new
      m.circle = @circle
      m.user = @user
      m.save
      redirect_to circle_path(@circle)
    else
      redirect_to circles_path, notice: "Oops, merci de recommencer"
    end
  end

  def circle_params
    params.require(:circle).permit(:title, :description)
  end
end

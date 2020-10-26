class MembershipsController < ApplicationController

  def create
    @membership = Membership.new(membership_params)
    @circle = Circle.find(params[:circle_id])
    @membership.circle = @circle
    if @membership.save
      redirect_to circle_path(@circle), notice: "Invitation envoyée !"
    else
      redirect_to circle_path(@circle), notice: "Something went wrong"
    end
  end

  def deactivate
    @circle = Circle.find(params[:circle_id])
    @membership = Membership.find_by(user_id: current_user, circle_id: @circle.id)
    @membership.active = false
    @membership.save
    redirect_to circles_path
  end

  private
  def membership_params
    params.require(:membership).permit(:user_id)
  end
end

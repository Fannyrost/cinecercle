class MembershipsController < ApplicationController

  def create
    # raise
    @membership = Membership.new(membership_params)
    @circle = Circle.find(params[:circle_id])
    @membership.circle = @circle
    if @membership.save
      redirect_to circle_path(@circle), notice: "Invitation envoyée !"
    else
      redirect_to circle_path(@circle), notice: "Something went wrong"
    end
  end

  def membership_params
    params.require(:membership).permit(:user_id)
  end
end

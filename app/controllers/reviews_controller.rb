class ReviewsController < ApplicationController
  def create
    @review                   = Review.new(review_params)
    @recommendation           = Recommendation.find(params[:recommendation_id])
    @circle                   = Circle.find(params[:circle_id])
    @membership               = Membership.find_by(circle_id: @circle.id, user_id: current_user.id)
    @review.recommendation_id = @recommendation.id
    @review.membership_id     = @membership.id

    if @review.save
      @watchlist = Watchlist.find_by(user_id: current_user.id, recommendation_id: @recommendation.id)
      unless @watchlist.nil?
        @watchlist.seen = false
        @watchlist.save
      end
      redirect_to circle_recommendation_path(@circle, @recommendation), notice: "Votre commentaire a été enregistré !"
    else
      redirect_to circle_recommendation_path(@circle, @recommendation), notice: "Oops, il faut recommencer!"
    end
  end


  private
  def review_params
    params.require(:review).permit(:rating, :content)
  end
end

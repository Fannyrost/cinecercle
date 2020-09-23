class RecommendationsController < ApplicationController
  def show
    @recommendation = Recommendation.find(params[:id])
  end

  def new
    @movie = Movie.find(params[:movie_id])
    @circle = Circle.find(params[:circle_id])
    @user = current_user
    @recommendation = Recommendation.new
  end

  def create
    # raise
    @user = current_user
    @movie = Movie.find(params[:movie_id])
    @circle = Circle.find(params[:circle_id])
    @membership = Membership.find_by(user_id: @user.id, circle_id: @circle.id)
    @recommendation = Recommendation.new(recommendations_params)
    @recommendation.movie = @movie
    @recommendation.membership = @membership

    if @recommendation.save
      redirect_to circle_recommendation_path(@circle, @recommendation)
    else
      redirect_to new_circle_movie_recommendation_path(@circle, @movie), notice: "Something went wrong"
    end
  end

  private

  def recommendations_params
    params
      .require(:recommendation)
      .permit(:review_content, :rating)
      # .merge(product_id: params[:product_id])
  end

end

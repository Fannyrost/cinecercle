class RecommendationsController < ApplicationController
  def show
  end

  def new
    @movie = Movie.find(params[:movie_id])
    @circle = Circle.find(params[:circle_id])
    @user = current_user
    @recommendation = Recommendation.new
  end

  def create
    @user = current_user
    @movie = Movie.find(params[:movie_id])
    @circle = Circle.find(params[:circle_id])
    @recommendation = Recommendation.new(recommendations_params)

    if @recommendation.save
      redirect_to circle_recommendation_path(@recommendation)
    else
      redirect_to new_circle_movie_recommendation_path(@circle, @movie), notice: "Something went wrong"
    end
  end

  private

  def recommendations_params
    params
      .require(:recommendation)
      .permit(:movie_id, :circle_id, :review_content, :rating)
      # .merge(product_id: params[:product_id])
  end

end

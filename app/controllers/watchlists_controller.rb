class WatchlistsController < ApplicationController
  def create
    @circle = Circle.find(params[:circle_id])
    @user = current_user
    @recommendation = Recommendation.find(params[:recommendation_id])
    @watchlist = Watchlist.new(user_id: @user.id, recommendation_id: @recommendation.id)
    if @watchlist.save
      redirect_to circle_recommendation_path(@circle, @recommendation), notice: "Film ajouté à votre watchlist!"
    else
      redirect_to circle_recommendation_path(@circle, @recommendation), notice: "Oops, nous avons rencontré une erreur, merci de réessayer !"
    end
  end
end

class WatchlistsController < ApplicationController
  def create
    @circle = Circle.find(params[:circle_id])
    @user = current_user
    @recommendation = Recommendation.find(params[:recommendation_id])
    @watchlist = Watchlist.find_by(user_id: current_user.id, recommendation_id: @recommendation.id)
    if @watchlist.nil?
      @watchlist = Watchlist.new(user_id: @user.id, recommendation_id: @recommendation.id)
      if @watchlist.save
        redirect_to circle_recommendation_path(@circle, @recommendation), notice: "Film ajouté à votre watchlist!"
      else
        redirect_to circle_recommendation_path(@circle, @recommendation), notice: "Oops, nous avons rencontré une erreur, merci de réessayer !"
      end
    else
      redirect_to circle_recommendation_path(@circle, @recommendation), notice: "Film déjà présent dans votre watchlist!"
    end
  end
end

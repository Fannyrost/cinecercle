class MoviesController < ApplicationController
  def index
    @circle = Circle.find(params[:circle_id])
    @user = current_user

  end

  def show
  end

  def new
  end

  def movie
    @imdbid = params[:imdbid]
    @movie = Movie.from_imdbid(@imdbid)
    @circle = Circle.find(params[:circle_id])
    @user = current_user

    if @movie.nil?
      redirect_to circle_movies_path, notice: "Something went wrong, try again"
    else
      redirect_to new_circle_movie_recommendation_path(@circle, @movie)
    end

  end
end

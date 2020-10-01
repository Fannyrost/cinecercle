class MoviesController < ApplicationController
  add_breadcrumb "Accueil ", :root_path
  add_breadcrumb " Mes cercles ", :circles_path

  def index
    @circle = Circle.find(params[:circle_id])
    add_breadcrumb "Cercle \" #{@circle.title} \"", circle_path(id: @circle.id )
    add_breadcrumb "Ajouter un film", :circle_movies_path
    @user = current_user
  end

  def movie
    @imdbid = params[:imdbid]
    @movie = Movie.from_imdbid(@imdbid)
    @circle = Circle.find(params[:circle_id])
    @user = current_user

    if @movie.nil?
      redirect_to circle_movies_path, notice: "Oups, nous avons rencontré une erreur, merci de réessayer"
    elsif @movie.already_recommended?(@circle.id)
      redirect_to circle_movies_path, alert: "Le film est déja recommandé dans le cercle"
    else
      redirect_to new_circle_movie_recommendation_path(@circle, @movie)
    end
  end
end

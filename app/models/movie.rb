class Movie < ApplicationRecord
  has_many :recommendations

  def self.from_imdbid(imdbid)
    Movie.find_by(imdbid: imdbid) || create_movie_from(imdbid)
  end

  def self.create_movie_from(imdbid)
    api_key = "ce8d3236"
    imdbid = imdbid
    url = "http://www.omdbapi.com/?i=#{imdbid}&apikey=#{api_key}"
    response = RestClient.get(url)
    movie = JSON.parse(response)

    m = Movie.new(
      imdbid: imdbid,
      title: movie['Title'],
      year: movie['Year'],
      genre: movie['Genre'],
      director: movie['Director'],
      actors: movie['Actors'],
      plot: movie['Plot'],
      poster: movie['Poster']
    )
    m.save!
    m
  end

end

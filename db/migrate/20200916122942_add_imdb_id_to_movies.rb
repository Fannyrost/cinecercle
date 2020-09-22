class AddImdbIdToMovies < ActiveRecord::Migration[6.0]
  def change
    add_column :movies, :imdbid, :integer
  end
end

class ChangeImdbidTypeinMovies < ActiveRecord::Migration[6.0]
  def change
    change_column :movies, :imdbid, :string
  end
end

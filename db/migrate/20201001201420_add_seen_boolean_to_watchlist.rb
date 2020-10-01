class AddSeenBooleanToWatchlist < ActiveRecord::Migration[6.0]
  def change
    add_column :watchlists, :seen, :boolean, default: false
  end
end

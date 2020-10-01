class CreateReviews < ActiveRecord::Migration[6.0]
  def change
    create_table :reviews do |t|
      t.references :membership, null: false, foreign_key: true
      t.references :recommendation, null: false, foreign_key: true
      t.integer :rating
      t.string :content

      t.timestamps
    end
  end
end

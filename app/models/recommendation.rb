class Recommendation < ApplicationRecord
  belongs_to :membership
  belongs_to :movie
  has_many :watchlists
  has_many :reviews

end

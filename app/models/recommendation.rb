class Recommendation < ApplicationRecord
  belongs_to :membership
  belongs_to :movie
  has_many :watchlists

end

class Recommendation < ApplicationRecord
  belongs_to :membership
  belongs_to :movie
end

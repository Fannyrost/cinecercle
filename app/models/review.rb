class Review < ApplicationRecord
  belongs_to :membership
  belongs_to :recommendation
end

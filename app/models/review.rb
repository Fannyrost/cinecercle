class Review < ApplicationRecord
  belongs_to :membership
  belongs_to :recommendation

  def self.average_rating(recommendation)
    r = Review.where(recommendation_id: recommendation.id)
    rating = 0
    count = 0
    r.each do |review|
      rating += review.rating
      count += 1
    end
    rating / count
  end
end

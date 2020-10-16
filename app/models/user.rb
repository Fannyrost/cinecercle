class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :circles
  has_many :memberships
  has_many :circles, through: :memberships
  has_many :watchlists
  has_one_attached :photo

  def reco_count
    reco_count = 0
    self.memberships.each { |m| reco_count +=1 }
    reco_count
  end

  def average_ratings_of_reco
    recommendations = []
    rating = 0
    count  = 0
    self.memberships.each do |m|
      m.recommendations.each { |r| recommendations << r }
    end
    recommendations.each do |reco|
      reco.reviews.each do |review|
        rating += review.rating
        count  += 1
      end
    end
    unless !count.nil?
      rating / count
    end
  end
end

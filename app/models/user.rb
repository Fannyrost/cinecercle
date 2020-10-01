class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :circles
  has_many :memberships
  has_many :circles, through: :memberships
  has_many :watchlists

  def reco_count
    reco_count = 0
    self.memberships.each { |m| reco_count +=1 }
    reco_count
  end
end

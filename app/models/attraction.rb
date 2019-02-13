class Attraction < ActiveRecord::Base

  validates :name, presence: true
  validates :nausea_rating, presence: true
  validates :happiness_rating, presence: true
  validates :tickets, presence: true
  validates :min_height, presence: true
  validates :nausea_rating, numericality: { only_integer: true }
  validates :happiness_rating, numericality: { only_integer: true }
  validates :min_height, numericality: { only_integer: true }

  has_many :rides
  has_many :users, through: :rides


    def go_on_ride(user)
        user.tickets - attraction.tickets
        user.nausea - attraction.nausea_rating
        user.happiness + attraction.happiness_rating
    end


end

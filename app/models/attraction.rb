class Attraction < ActiveRecord::Base

  has_many :rides
  has_many :users, through: :rides


    def go_on_ride(user)
        user.tickets - attraction.tickets
        user.nausea - attraction.nausea_rating
        user.happiness + attraction.happiness_rating
    end


end

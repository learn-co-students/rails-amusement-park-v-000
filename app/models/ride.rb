class Ride < ApplicationRecord
    belongs_to :user
    belongs_to :attraction
  
    def take_ride
  
      tickets_insufficient = ''
      height_insufficient = ''
  
      if user.tickets < attraction.tickets
        tickets_insufficient = " You do not have enough tickets to ride the #{attraction.name}."
      end
  
      if user.height < attraction.min_height
        height_insufficient = " You are not tall enough to ride the #{attraction.name}."
      end
  
      if !tickets_insufficient.empty? || !height_insufficient.empty?
        "Sorry." + tickets_insufficient + height_insufficient
      else
        user.tickets -= attraction.tickets
        user.nausea += attraction.nausea_rating
        user.happiness += attraction.happiness_rating
        user.save
        "Thanks for riding the #{attraction.name}!"
      end
  
    end
  end
  
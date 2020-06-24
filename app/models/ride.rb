class Ride < ActiveRecord::Base
  belongs_to :user
  belongs_to :attraction

  def take_ride
    if user.tickets < attraction.tickets && user.height < attraction.min_height
      return "Sorry. You do not have enough tickets to ride the #{attraction.name}. You are not tall enough to ride the #{attraction.name}."
    else
      if user.tickets < attraction.tickets
        return "Sorry. You do not have enough tickets to ride the #{attraction.name}."
      elsif user.height < attraction.min_height
        return "Sorry. You are not tall enough to ride the #{attraction.name}."
      end
    end

    user.tickets -= attraction.tickets
    user.happiness += attraction.happiness_rating
    user.nausea += attraction.nausea_rating
    user.save
    "Thanks for riding the #{attraction.name}!"
  end
end

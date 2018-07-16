class Ride < ActiveRecord::Base
  belongs_to :user
  belongs_to :attraction

  def take_ride
    if user && attraction
      if user.tickets < attraction.tickets && user.height < attraction.min_height
        not_have_enough_tickets + not_tall_enough
      elsif user.tickets < attraction.tickets
        not_have_enough_tickets
      elsif user.height < attraction.min_height
        "Sorry." + not_tall_enough
      else
        if user.nausea.nil?
          user.nausea = 0
        end
        user.tickets -= attraction.tickets
        user.nausea += attraction.nausea_rating
        user.happiness += attraction.happiness_rating
        user.save
        "Thanks for riding the #{attraction.name}!"
      end
    end
  end

  def not_tall_enough
    " You are not tall enough to ride the #{attraction.name}."
  end

  def not_have_enough_tickets
    "Sorry. You do not have enough tickets to ride the #{attraction.name}."
  end


end

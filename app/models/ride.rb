class Ride < ActiveRecord::Base
  
  belongs_to :user
  belongs_to :attraction

  def take_ride
    if deficient && short
      "Sorry. #{insufficient_tickets}. #{insufficient_height}."
    elsif deficient
      "Sorry. #{insufficient_tickets}."
    elsif short
      "Sorry. #{insufficient_height}."
    else
      user.tickets -= attraction.tickets
      user.happiness += attraction.happiness_rating
      user.nausea += attraction.nausea_rating
      user.save
      "Thanks for riding the #{attraction.name}!"
    end
  end

  def deficient
      user.tickets < attraction.tickets
  end

  def short
      user.height < attraction.min_height
  end

  def insufficient_tickets
    "You do not have enough tickets to ride the #{attraction.name}"
  end

  def insufficient_height
    "You are not tall enough to ride the #{attraction.name}"
  end
end

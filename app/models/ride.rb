class Ride < ActiveRecord::Base
  belongs_to :attraction
  belongs_to :user

  def take_ride
    if user.tickets >= attraction.tickets && user.height >= attraction.min_height
      user.update_attribute(:tickets, user.tickets -= attraction.tickets)
      user.update_attribute(:nausea, user.nausea += attraction.nausea_rating)
      user.update_attribute(:happiness, user.happiness += attraction.happiness_rating)
    elsif user.tickets < attraction.tickets && user.height < attraction.min_height
      "Sorry. You do not have enough tickets to ride the #{self.attraction.name}. You are not tall enough to ride the #{attraction.name}."
    elsif user.tickets < attraction.tickets
      "Sorry. You do not have enough tickets to ride the #{attraction.name}."
    elsif user.height < attraction.min_height
      "Sorry. You are not tall enough to ride the #{attraction.name}."
    end
  end
end

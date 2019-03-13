class Ride < ActiveRecord::Base
  belongs_to :user
  belongs_to :attraction


  private

  def take_ride
    attraction = self.attraction
    user = self.user

  if attraction.tickets > user.tickets && attraction.min_height > user.height
    "Sorry. You do not have enough tickets to ride the #{attraction.name}. You are not tall enough to ride the #{self.attraction.name}."
  elsif attraction.tickets > user.tickets
    "Sorry. You do not have enough tickets to ride the #{attraction.name}."
  elsif attraction.min_height > user.height
    "Sorry. You are not tall enough to ride the #{attraction.name}."
  else
    user.update(tickets: user.tickets - attraction.tickets,
    nausea: user.nausea + attraction.nausea_rating,
    happiness: user.happiness + attraction.happiness_rating)
      end
    end
  end

class Ride < ApplicationRecord
  belongs_to :user
  belongs_to :attraction

  def take_ride
    msg = ""
    msg += ticket_message if self.user.tickets < self.attraction.tickets
    msg += tall_message if self.user.height < self.attraction.min_height

    #errors
    if msg != ""
      msg = "Sorry." + msg

    #no errors
    else
      self.user.tickets -= self.attraction.tickets
      self.user.nausea += self.attraction.nausea_rating
      self.user.happiness += self.attraction.happiness_rating
      self.user.save
      msg = "Thanks for riding the #{self.attraction.name}!"
    end

    msg

  end

  def tall_message
    " You are not tall enough to ride the #{self.attraction.name}."
  end

  def ticket_message
    " You do not have enough tickets to ride the #{self.attraction.name}."
  end
end

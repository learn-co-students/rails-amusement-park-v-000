class Ride < ActiveRecord::Base
  belongs_to :user
  belongs_to :attraction

  def take_ride
    if self.ticket_check && self.height_check
      rides
    else
      no_ride
    end
  end

  def ticket_check
    self.user.tickets >= self.attraction.tickets
  end

  def height_check
    self.user.height >= self.attraction.min_height
  end

  def rides
    user = self.user
    attraction = self.attraction

    #subtract num of attraction.tickets from user.tickets
    user.tickets -= attraction.tickets
    user.nausea += attraction.nausea_rating
    user.happiness += attraction.happiness_rating
    user.save
    message = "Thanks for riding the #{attraction.name}!"

    message
  end

  def no_ride
    message = String.new
    if !ticket_check && !height_check
      message = "Sorry. You do not have enough tickets to ride the #{self.attraction.name}. You are not tall enough to ride the #{self.attraction.name}."
    elsif !ticket_check
      message = "Sorry. You do not have enough tickets to ride the #{self.attraction.name}."
    elsif !height_check
      message = "Sorry. You are not tall enough to ride the #{self.attraction.name}."
    end
    message
  end
end

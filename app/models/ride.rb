class Ride < ActiveRecord::Base
  belongs_to :user
  belongs_to :attraction

  def tall_enough?
    #accounts for the user not being tall enough
    self.user.height > self.attraction.min_height
  end

  def enough_tickets?
    #accounts for user not having enough tickets
    self.user.tickets > self.attraction.tickets
  end

  def able_to_ride?
    tall_enough? && enough_tickets?
  end

  def generate_ride_error_message
    error = "Sorry."
    if !enough_tickets?
      error << " You do not have enough tickets to ride the #{self.attraction.name}."
    end
    if !tall_enough?
      error << " You are not tall enough to ride the #{self.attraction.name}."
    end
    error
  end

  def take_ride
    #ticket and height validation
    if able_to_ride?
      #updates ticket_number, nausea, happiness
      self.user.tap do |u|
        u.tickets -= self.attraction.tickets
        u.nausea += self.attraction.nausea_rating
        u.happiness += self.attraction.happiness_rating
        u.save
      end
      nil #returns nil if user update successful 
    else
      generate_ride_error_message
    end
  end
end

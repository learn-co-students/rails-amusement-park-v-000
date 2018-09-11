class Ride < ActiveRecord::Base
  belongs_to :user
  belongs_to :attraction


  def meets_requirements?
    if is_tall_enough? && has_enough_tickets?
      return true
    else
      return false
    end
  end

  def process_ride
    self.user.tickets = self.user.tickets - self.attraction.tickets
    self.user.happiness = self.user.happiness + self.attraction.happiness_rating if self.attraction.happiness_rating
    self.user.nausea = self.user.nausea + self.attraction.nausea_rating if self.attraction.nausea_rating

    self.user.save
  end

  def take_ride
    if meets_requirements?
      process_ride
      thank_you_message

    elsif !is_tall_enough? && !has_enough_tickets?
      "Sorry. #{tickets_message} #{height_message}"

    elsif !is_tall_enough?
      "Sorry. #{height_message}"

    elsif !has_enough_tickets?
      "Sorry. #{tickets_message}"
    end
  end

  def is_tall_enough?
    self.user.height >= self.attraction.min_height ? true : false
  end


  def has_enough_tickets?
    self.user.tickets >= self.attraction.tickets ? true : false
  end


  def height_message
    "You are not tall enough to ride the #{self.attraction.name}."
  end

  def tickets_message
    "You do not have enough tickets to ride the #{self.attraction.name}."
  end

  def thank_you_message
    "Thanks for riding the #{self.attraction.name}!"
  end

end

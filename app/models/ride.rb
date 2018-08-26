require 'pry'

class Ride < ActiveRecord::Base
  belongs_to :attraction
  belongs_to :user

  def take_ride
    if !sufficient_tickets && tall_enough
      puts "Sorry. You do not have enough tickets to ride the #{self.attraction.name}."
    elsif !tall_enough && sufficient_tickets
      puts "Sorry. You are not tall enough to ride the #{self.attraction.name}."
    elsif !sufficient_tickets && !tall_enough
      puts "Sorry. You do not have enough tickets to ride the #{self.attraction.name}. You are not tall enough to ride the #{self.attraction.name}."
    else
      self.user.tickets -= self.attraction.tickets
      self.user.happiness += self.attraction.happiness_rating
      self.user.nausea += self.attraction.nausea_rating
    end
  end

  def sufficient_tickets
    self.user.tickets >= self.attraction.tickets
  end

  def tall_enough
    self.user.height >= self.attraction.min_height
  end

end

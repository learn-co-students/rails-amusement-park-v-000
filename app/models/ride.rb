class Ride < ApplicationRecord
  belongs_to :attraction
  belongs_to :user

  def take_ride
    if current_user.height >= self.attraction.min_height && current_user.tickets >= self.attraction.tickets
      current_user.tickets = current_user.tickets - 1
      current_user.happiness = current_user.happiness + self.attraction.happiness_rating
      current_user.nausea = current_user.nausea + self.attraction.nausea_rating
      self.save
    elsif current_user.height < self.attraction.min_height || current_user.tickets < self.attraction.tickets
      if current_user.tickets < self.attraction.tickets
        puts "Sorry. You do not have enough tickets to ride the #{attraction.name}."
      elsif current_user.height < self.attraction.min_height
        puts "Sorry. You are not tall enough to ride the #{attraction.name}."
      end
    else
      puts "Sorry. You do not have enough tickets to ride the #{attraction.name}. You are not tall enough to ride the #{attraction.name}."
    end
  end
  
end

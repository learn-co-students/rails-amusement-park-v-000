class Ride < ActiveRecord::Base
  belongs_to :user
  belongs_to :attraction

  def take_ride
    user = User.find_by_id(self.user_id)
    attraction = Attraction.find_by_id(self.attraction_id)

    puts "User has #{user.tickets}, and attraction requires #{attraction.tickets}"

    if (user.tickets < attraction.tickets) && (user.height < attraction.min_height)
      return "Sorry. You do not have enough tickets to ride the #{attraction.name}. You are not tall enough to ride the #{attraction.name}."
    elsif user.tickets < attraction.tickets
      return "Sorry. You do not have enough tickets to ride the #{attraction.name}."
    elsif user.height < attraction.min_height
      return "Sorry. You are not tall enough to ride the #{attraction.name}."
    else
      user.update_attribute(:tickets, user.tickets - attraction.tickets)
      user.update_attribute(:nausea, user.nausea + attraction.nausea_rating)
      user.update_attribute(:happiness, user.happiness + attraction.happiness_rating)
      return "Thanks for riding the #{attraction.name}!"
    end
  end
end
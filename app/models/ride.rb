class Ride < ActiveRecord::Base
  belongs_to :user
  belongs_to :attraction

  def take_ride
    user = User.find_by(id: self.user_id)
    attraction = Attraction.find_by(id: self.attraction_id)
    if user.height < attraction.min_height && user.tickets < attraction.tickets
      "Sorry. You do not have enough tickets to ride the #{attraction.name}. You are not tall enough to ride the #{attraction.name}."
    elsif user.height < attraction.min_height
      "Sorry. You are not tall enough to ride the #{attraction.name}."
    elsif user.tickets < attraction.tickets
      "Sorry. You do not have enough tickets to ride the #{attraction.name}."
    else
      user.tickets = user.tickets - attraction.tickets
      user.nausea = user.nausea + attraction.nausea_rating
      user.happiness = user.happiness + attraction.happiness_rating
      user.save
      "Thanks for riding the #{attraction.name}!"
    end
  end
end

#Sorry. You do not have enough tickets to ride the #{attraction.name}
#Sorry. You are not tall enough to ride the #{attraction.name}.
#"Sorry. You do not have enough tickets to ride the #{attraction.name}. You are not tall enough to ride the #{attraction.name}."
#Ride has a method 'take_ride' that updates ticket number
#Ride has a method 'take_ride' that updates the user's nausea
#Ride has a method 'take_ride' that updates the user's happiness

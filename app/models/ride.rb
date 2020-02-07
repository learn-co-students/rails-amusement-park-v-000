class Ride < ActiveRecord::Base
  belongs_to :attraction
  belongs_to :user

  def take_ride
    ticket_cost = attraction.tickets
    if attraction.min_height > user.height && ticket_cost > user.tickets 
      "Sorry. You do not have enough tickets to ride the #{attraction.name}. You are not tall enough to ride the #{attraction.name}."
    elsif ticket_cost > user.tickets
      "Sorry. You do not have enough tickets to ride the #{attraction.name}."
    elsif attraction.min_height > user.height
      "Sorry. You are not tall enough to ride the #{attraction.name}."
    else
      update
    end
  end


  def update 
    ticket_number = user.tickets - attraction.tickets
    user_nausea = user.nausea + attraction.nausea_rating 
    user_happiness = user.happiness + attraction.happiness_rating
    user.update(tickets: ticket_number, nausea: user_nausea, happiness: user_happiness)
  end
end

# rspec ./spec/models/ride_spec.rb:41 # Ride has a method 'take_ride' that accounts for the user not having enough tickets
# rspec ./spec/models/ride_spec.rb:49 # Ride has a method 'take_ride' that accounts for the user not being tall enough
# rspec ./spec/models/ride_spec.rb:58 # Ride has a method 'take_ride' that accounts for the user not being tall enough and not having enough tickets
# rspec ./spec/models/ride_spec.rb:67 # Ride has a method 'take_ride' that updates ticket number
# rspec ./spec/models/ride_spec.rb:75 # Ride has a method 'take_ride' that updates the user's nausea
# rspec ./spec/models/ride_spec.rb:83 # Ride has a method 'take_ride' that updates the user's happiness
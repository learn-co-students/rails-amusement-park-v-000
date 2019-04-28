require 'pry'
class Ride < ActiveRecord::Base
  belongs_to :attraction
  belongs_to :user


#"has a method 'take_ride' that accounts for the user not being tall enough and not having enough tickets"
  def take_ride
binding.pry
    if user.tickets < attraction.tickets && user.height < attraction.min_height
      "Sorry. You do not have enough tickets to ride the #{attraction.name}. You are not tall enough to ride the #{attraction.name}."

        return "Sorry. You do not have enough tickets to ride the #{attraction.name}."
        binding.pry
    if user.height < attraction.min_height
          return "Sorry. You are not tall enough to ride the #{attraction.name}."
    else
      puts "Sorry. You do not have enough tickets to ride the #{attraction.name}. You are not tall enough to ride the #{attraction.name}."
    end
  end
  end

end

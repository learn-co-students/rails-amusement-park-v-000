class Ride < ApplicationRecord
	belongs_to :user
	belongs_to :attraction

	# has a method 'take_ride' that accounts for the user not having enough tickets (FAILED - 43)
 #  has a method 'take_ride' that accounts for the user not being tall enough (FAILED - 44)
 #  has a method 'take_ride' that accounts for the user not being tall enough and not having enough tickets (FAILED - 45)
 #  has a method 'take_ride' that updates ticket number (FAILED - 46)
 #  has a method 'take_ride' that updates the user's nausea (FAILED - 47)
 #  has a method 'take_ride' that updates the user's happiness (FAILED - 48)

  def take_ride

  	user = User.find_by(id: self.user_id)
  	attraction = Attraction.find_by(id: self.attraction_id)

  	if user.tickets < attraction.tickets && user.height < attraction.min_height
  		return "Sorry. You do not have enough tickets to ride the #{attraction.name}. You are not tall enough to ride the #{attraction.name}."
  	elsif user.tickets < attraction.tickets
  		return "Sorry. You do not have enough tickets to ride the #{attraction.name}."
  	elsif user.height < attraction.min_height
  		return "Sorry. You are not tall enough to ride the #{attraction.name}."
  	else

	  	user.update(:happiness => user.happiness + attraction.happiness_rating)
	  	user.update(:nausea => user.nausea + attraction.nausea_rating)
	  	user.update(:tickets => user.tickets - attraction.tickets)

	  	return "Thanks for riding the #{attraction.name}!"

   end

  end

end

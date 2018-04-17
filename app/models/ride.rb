class Ride < ActiveRecord::Base
	belongs_to :user
	belongs_to :attraction

	def take_ride
	    enough_tickets, tall_enough = meet_requirements
	    if enough_tickets && tall_enough
	      start_ride
	    elsif tall_enough && !enough_tickets
	      "Sorry. " + ticket_issue
	    elsif enough_tickets && !tall_enough
	      "Sorry. " + height_issue
	    else
	      "Sorry. " + ticket_issue + " " + height_issue
	    end
	  end

	  def meet_requirements
	    enough_tickets, tall_enough = false
		    if user.tickets >= attraction.tickets
		      enough_tickets = true
		    end

		    if user.height >= attraction.min_height
		      tall_enough = true
		    end
	    return [enough_tickets, tall_enough]
	  end

	  def start_ride
	    new_happiness = user.happiness + attraction.happiness_rating
	    new_nausea = user.nausea + attraction.nausea_rating
	    new_tickets =  user.tickets - attraction.tickets

	    user.update_attribute(:happiness, new_happiness)
	    user.update_attribute(:nausea, new_nausea)
	    user.update_attribute(:tickets, new_tickets)

	    "Thanks for riding the #{self.attraction.name}!"
	  end

	  def ticket_issue
	    "You do not have enough tickets to ride the #{self.attraction.name}."
	  end

	  def height_issue
	    "You are not tall enough to ride the #{self.attraction.name}."
	  end

	# def take_ride
	# 	set_user
	# 	set_attraction
	# 	binding.pry
	# 	# if is_tall_enough && has_enough_tickets
	# 	@user.update_attribute(:tickets, (user.tickets - attraction.tickets))
	# 	@user.update_attribute(:nausea, (user.nausea + attraction.nausea_rating))
	# 	@user.update_attribute(:happiness, (user.happiness + attraction.happiness_rating))
		
	# 	return true
	# 	# elsif !is_tall_enough
	# 	# 	# flash[:notice] << 'Sorry. You do not have enough tickets to ride the #{attraction.name}.'
	# 	# elsif !has_enough_tickets
	# 	# 	# flash[:notice] << 'Sorry. You are not tall enough to ride the #{attraction.name}.'
	# 	# end
	# end

	# private

	# def not_tall_enough
	# 	"Sorry, " + 
	# end

	# def has_enough_tickets
	# 	user.tickets >= attraction.tickets
	# end

	# def set_user
	# 	user = User.find(user_id)
	# end

	# def set_attraction
	# 	attraction = Attraction.find(attraction_id)
	# end	
end


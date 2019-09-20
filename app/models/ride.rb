class Ride < ApplicationRecord
  belongs_to :user
  belongs_to :attraction

  def take_ride
    attraction = Attraction.find_by(:id => self.attraction_id)
    user = User.find_by(:id => self.user_id)

    if user.tickets < attraction.tickets && user.height < attraction.min_height 
      "Sorry. You do not have enough tickets to ride the #{attraction.name}. You are not tall enough to ride the #{attraction.name}."
    elsif user.tickets < attraction.tickets
      "Sorry. You do not have enough tickets to ride the #{attraction.name}."
    elsif user.height < attraction.min_height
      "Sorry. You are not tall enough to ride the #{attraction.name}."
    elsif user.tickets > attraction.tickets
      rem_tickets = user.tickets - attraction.tickets
      n_rating = user.nausea + attraction.nausea_rating
      h_rating = user.happiness + attraction.happiness_rating
      user.update(:tickets => rem_tickets, :nausea => n_rating, :happiness => h_rating)
      "Thanks for riding the #{attraction.name}!"
    end
  end
end

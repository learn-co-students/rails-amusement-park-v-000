class Ride < ActiveRecord::Base
  belongs_to :attraction
  belongs_to :user


  def take_ride
    ride = Ride.create(:user_id => user.id, :attraction_id => attraction.id)
    if ride.attraction.tickets > ride.user.tickets && ride.attraction.min_height > ride.user.height
      "Sorry. You do not have enough tickets to ride the #{attraction.name}. You are not tall enough to ride the #{attraction.name}."
    elsif ride.attraction.tickets > ride.user.tickets
      "Sorry. You do not have enough tickets to ride the #{attraction.name}."
    elsif ride.attraction.min_height > ride.user.height
      "Sorry. You are not tall enough to ride the #{attraction.name}."
    else
      ride.user.update(
      :tickets => ride.user.tickets - ride.attraction.tickets,
      :nausea => ride.user.nausea + ride.attraction.nausea_rating,
      :happiness => ride.user.happiness + ride.attraction.happiness_rating
      )
      "Thanks for riding the #{self.attraction.name}!"
    end
  end

end

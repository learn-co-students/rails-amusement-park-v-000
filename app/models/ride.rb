class Ride < ActiveRecord::Base
  belongs_to :user
  belongs_to :attraction
  validates :user_id, presence: true
  validates :attraction_id, presence: true

  def take_ride
    user = User.find(self.user_id)
    attraction = Attraction.find(self.attraction_id)

    if user.tickets < attraction.tickets && user.height < attraction.min_height
      "Sorry. You do not have enough tickets to ride the #{attraction.name}. You are not tall enough to ride the #{attraction.name}."
    elsif user.tickets < attraction.tickets
      "Sorry. You do not have enough tickets to ride the #{attraction.name}."
    elsif user.height < attraction.min_height
      "Sorry. You are not tall enough to ride the #{attraction.name}."
    else
      user.tickets = user.tickets - attraction.tickets
      user.nausea = user.nausea + attraction.nausea_rating
      user.happiness = user.happiness + attraction.happiness_rating

      User.update(user.id, :tickets => user.tickets, :happiness => user.happiness, :nausea => user.nausea)
    end
  end
end

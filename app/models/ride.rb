class Ride < ActiveRecord::Base
  belongs_to :attraction
  belongs_to :user
  validates :user_id, presence: true
  validates :attraction_id, presence: true

  def take_ride
    #condition for user not having enough tickets
    if !enough_tickets? && !tall_enough?
      "Sorry. You do not have enough tickets to ride the #{attraction.name}. You are not tall enough to ride the #{attraction.name}."
    elsif !enough_tickets?
      "Sorry. You do not have enough tickets to ride the #{attraction.name}."
    elsif !tall_enough?
      "Sorry. You are not tall enough to ride the #{attraction.name}."
    else
      #take the ride
      user.tickets -= attraction.tickets
      user.nausea += attraction.nausea_rating
      user.happiness += attraction.happiness_rating
      user.save
    end
  end

  def tall_enough?
    user.height > attraction.min_height
  end

  def enough_tickets?
    user.tickets > attraction.tickets
  end
end

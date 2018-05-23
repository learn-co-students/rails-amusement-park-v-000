class Ride < ApplicationRecord
  belongs_to :user
  belongs_to :attraction

  def take_ride
    if enough_tickets? && tall_enough?
      update_user_attr
      "Thanks for riding the #{attraction.name}!"
    elsif !enough_tickets? && !tall_enough?
      "Sorry. You do not have enough tickets to ride the #{attraction.name}. You are not tall enough to ride the #{attraction.name}."
    elsif !enough_tickets?
      "Sorry. You do not have enough tickets to ride the #{attraction.name}."
    elsif !tall_enough?
      "Sorry. You are not tall enough to ride the #{attraction.name}."
    end
  end

  def enough_tickets?
    #not DRY -- refactor
    user = User.find_by(id: self.user_id)
    attraction = Attraction.find_by(id: self.attraction_id)
    user.tickets >= attraction.tickets
  end

  def tall_enough?
    #not DRY -- refactor
    user = User.find(self.user_id)
    attraction = Attraction.find(self.attraction_id)
    user.height >= attraction.min_height
  end

  def update_user_attr
    #not DRY -- refactor
    user = User.find(self.user_id)
    attraction = Attraction.find(self.attraction_id)
    user.tickets -= attraction.tickets
    user.nausea += attraction.nausea_rating
    user.happiness += attraction.happiness_rating
    user.save
  end
end

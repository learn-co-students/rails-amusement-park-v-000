class Ride < ActiveRecord::Base
  belongs_to :user
  belongs_to :attraction

  def take_ride
    if tall_enough? && enough_tickets?
      user.tickets -= attraction.tickets
      user.nausea += attraction.nausea_rating
      user.happiness += attraction.happiness_rating
      user.save
      "Thanks for riding the #{attraction.name}!"
    elsif !tall_enough? && enough_tickets?
      "Sorry. You are not tall enough to ride the #{attraction.name}."
    elsif tall_enough? && !enough_tickets?
      "Sorry. You do not have enough tickets to ride the #{attraction.name}."
    elsif !tall_enough? && !enough_tickets?
      "Sorry. You do not have enough tickets to ride the #{attraction.name}. You are not tall enough to ride the #{attraction.name}."
    end
  end

  private

  def tall_enough?
    if user.height >= attraction.min_height
      true
    else
      false
    end
  end

  def enough_tickets?
    if user.tickets >= attraction.tickets
      true
    else
      false
    end
  end
end

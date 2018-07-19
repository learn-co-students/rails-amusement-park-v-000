class Ride < ActiveRecord::Base
  belongs_to :user
  belongs_to :attraction

  def take_ride
    if not_enough_tickets && self.not_tall_enough
      return "Sorry. You do not have enough tickets to ride the #{attraction.name}. You are not tall enough to ride the #{attraction.name}."
    elsif not_enough_tickets
      return "Sorry. You do not have enough tickets to ride the #{attraction.name}."
    elsif not_tall_enough
      return "Sorry. You are not tall enough to ride the #{attraction.name}."
    else
      take_tickets
      update_nausea
      update_happiness
      user.save
    end
  end

  def not_enough_tickets
    user.tickets < attraction.tickets
  end

  def not_tall_enough
    user.height < attraction.min_height
  end

  def take_tickets
    user.tickets -= attraction.tickets
  end

  def update_nausea
    user.nausea += attraction.nausea_rating
  end

  def update_happiness
    user.happiness += attraction.happiness_rating
  end

end

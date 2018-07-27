class Ride < ActiveRecord::Base
  belongs_to :user
  belongs_to :attraction

  def take_ride
    if too_few_tickets? && too_short?
      "Sorry. You do not have enough tickets to ride the #{attraction.name}. You are not tall enough to ride the #{attraction.name}."
    elsif too_few_tickets?
      "Sorry. You do not have enough tickets to ride the #{attraction.name}."
    elsif too_short?
      "Sorry. You are not tall enough to ride the #{attraction.name}."
    else
      subtract_tickets
      add_nausea
      add_happiness
    end
  end

  def subtract_tickets
    user.update(tickets: user.tickets -= attraction.tickets)
  end

  def add_nausea
    user.update(nausea: user.nausea += attraction.nausea_rating)
  end

  def add_happiness
    user.update(happiness: user.happiness += attraction.happiness_rating)
  end

  def too_few_tickets?
    user.tickets < attraction.tickets
  end

  def too_short?
    user.height < attraction.min_height
  end



end

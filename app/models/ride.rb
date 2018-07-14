class Ride < ActiveRecord::Base
  belongs_to :user
  belongs_to :attraction

  def take_ride
    if (!ticket_condition?) && (!height_condition?)
      "Sorry. You do not have enough tickets to ride the #{attraction.name}. You are not tall enough to ride the #{attraction.name}."
    elsif !height_condition?
      "Sorry. You are not tall enough to ride the #{attraction.name}."
    elsif !ticket_condition?
      "Sorry. You do not have enough tickets to ride the #{attraction.name}."
    else ticket_condition? && height_condition?
      update_ticket
      update_nausea
      update_happiness
      user.save
    end
  end

  def ticket_condition?
    user.tickets > attraction.tickets
  end

  def height_condition?
    user.height > attraction.min_height
  end

  def update_ticket
    user.tickets -= attraction.tickets
  end

  def update_nausea
    user.nausea += attraction.nausea_rating
  end

  def update_happiness
    user.happiness += attraction.happiness_rating
  end
end

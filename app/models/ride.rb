class Ride < ActiveRecord::Base
  belongs_to :user
  belongs_to :attraction

  def valid_height
    user.height >= attraction.min_height
  end

  def valid_tickets
    user.tickets >= attraction.tickets
  end

  def valid_ride?
    true if valid_height && valid_tickets
  end

  def update_user_details
    user.tickets -= attraction.tickets
    user.nausea += attraction.nausea_rating
    user.happiness += attraction.happiness_rating
    user.save
    save
  end

  def display_message
    if !valid_height && !valid_tickets
      "Sorry. You do not have enough tickets to ride the #{attraction.name}. You are not tall enough to ride the #{attraction.name}."
    elsif !valid_height && valid_tickets
      "Sorry. You are not tall enough to ride the #{attraction.name}."
    elsif valid_height && !valid_tickets
      "Sorry. You do not have enough tickets to ride the #{attraction.name}."
    else
      "Thanks for riding the #{attraction.name}!"
    end
  end

  def take_ride
    update_user_details if valid_ride?

    display_message
  end
end

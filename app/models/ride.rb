class Ride < ActiveRecord::Base
  belongs_to :user
  belongs_to :attraction

  def take_ride
    if error_msg.blank?
      user.tickets -= attraction.tickets
      user.nausea += attraction.nausea_rating
      user.happiness += attraction.happiness_rating
      user.save
    else
      error_msg
    end
  end

  private

  def not_enough_tickets_msg
    msg = ''
    if user.tickets < attraction.tickets
      msg = "Sorry. You do not have enough tickets to ride the #{attraction.name}."
    end
    msg
  end

  def too_short_msg(msg)
    my_msg = "You are not tall enough to ride the #{attraction.name}."
    if user.height < attraction.min_height
      if !msg.blank?
        msg = msg + " " + my_msg
      else
        msg = "Sorry. " + my_msg
      end
    end
    msg
  end

  def error_msg
    too_short_msg(not_enough_tickets_msg)
  end

end

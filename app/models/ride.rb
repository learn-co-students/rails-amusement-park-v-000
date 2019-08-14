class Ride < ActiveRecord::Base
belongs_to :user
belongs_to :attraction


  def take_ride
    if check_tickets == nil
      check_height
    elsif check_height == nil
      check_tickets
    else
      check_tickets + " #{check_height}"
    end
  end

  def check_tickets
      "Sorry. You do not have enough tickets to ride the #{attraction.name}." if user.tickets < attraction.tickets
  end

  def check_height
      "Sorry. You are not tall enough to ride the #{attraction.name}." if user.height < attraction.min_height
  end

end# of class


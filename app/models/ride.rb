class Ride < ActiveRecord::Base
belongs_to :user
belongs_to :attraction


  def take_ride
binding.pry
    check_tickets 
    check_height
  end

  def check_tickets
      "Sorry. You do not have enough tickets to ride the #{attraction.name}." if user.tickets < attraction.tickets
  end

  def check_height
      "Sorry. You are not tall enough to ride the #{attraction.name}." if user.height < attraction.min_height
  end

end# of class


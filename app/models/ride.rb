class Ride < ActiveRecord::Base
  belongs_to :attraction
  belongs_to :user

  def take_ride
    if !!User.enough_tickets
      self.user.my_happiness = 1
    else
      return "Sorry. You do not have enough tickets to ride the Roller Coaster."
    end
  end
end

class Ride < ActiveRecord::Base
  belongs_to :user
  belongs_to :attraction

  def take_ride

    if self.user.tickets < attraction.tickets
      "Sorry. You do not have enough tickets to ride the #{attraction.name}."
    elsif self.user.height < attraction.min_height
      "Sorry. You are not tall enough to ride the #{attraction.name}."
    else
      "Have Fun!"
    end


  end



end

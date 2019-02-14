class Ride < ActiveRecord::Base
  belongs_to :user
  belongs_to :attraction

  def take_ride
    user = self.user
    attraction = self.attraction
    if user.height < attraction.min_height
      "Not tall enough"
    end
  end
end

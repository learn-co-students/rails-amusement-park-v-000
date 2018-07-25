class Ride < ActiveRecord::Base
  belongs_to :attraction
  belongs_to :user

  def take_ride
  end
  
end

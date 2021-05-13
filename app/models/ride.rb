class Ride < ActiveRecord::Base
  belongs_to :user
  belongs_to :attraction

  def take_ride

      "Sorry. You do not have enough tickets to ride the #{attraction.name}."
    end
  end

  def mood
  end
end

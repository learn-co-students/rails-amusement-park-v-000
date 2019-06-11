class Ride < ApplicationRecord

  belongs_to :attraction
  belongs_to :user

  def take_ride

    # use a case statement for each of the options
  end
end

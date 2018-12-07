require "pry"

class Ride < ActiveRecord::Base
  belongs_to :user
  belongs_to :attraction

# height must be greater than x?
# tickets must be greater than y?
# increase happiness
# increase nausea

  def take_ride

  end

end # class Ride

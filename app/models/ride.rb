class Ride < ActiveRecord::Base
  # Let's go ahead and copy the pattern in the upper left-hand corner of this
  # diagram here:
  # https://i.imgur.com/TZbbDay.jpg
  # ...in which the following changes will be made:
  # "rides" will replace "comments"
  # "attractions" will replace "posts"
  # ...and users will stay the same.
  belongs_to :user
  belongs_to :attraction

  # The tests expect this to take in no arguments
  def take_ride

    # This happens if the user is both too short & ticketless to take the ride:
    if self.user.tickets < self.attraction.tickets && self.user.height < self.attraction.min_height
      # The rspec tests expect this output to be the return value:
      "Sorry. You do not have enough tickets to ride the #{attraction.name}. You are not tall enough to ride the #{attraction.name}."

    # This happens if the user is too short for the ride
    elsif self.user.tickets < self.attraction.tickets
      # The rspec tests expect this output to be the return value:
      "Sorry. You do not have enough tickets to ride the #{attraction.name}."

    # This happens of the user is too ticketless for the ride
    elsif self.user.height < self.attraction.min_height
      # The rspec tests expect this output to be the return value:
      "Sorry. You are not tall enough to ride the #{attraction.name}."

    # This closes the door on situations where the user can't take the ride.
    # The loop doesn't end here because if it did, the rest of the code below
    # would be ignored.  Now that this whole thing is in one giant loop, the
    # "return" values above can be removed.

    else
      # Assuming the user has the height & resources, The user will pay for the ride in tickets
      self.user.tickets = self.user.tickets - self.attraction.tickets
      self.user.nausea = self.attraction.nausea_rating + self.user.nausea
      self.user.happiness = self.attraction.happiness_rating + self.user.happiness
      self.user.save
    end
  end
end

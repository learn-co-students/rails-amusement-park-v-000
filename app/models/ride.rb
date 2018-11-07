class Ride < ActiveRecord::Base
  belongs_to :attraction
  belongs_to :user

  def take_ride
    (return @error) if has_errors?
    user.tickets -= attraction.tickets
    user.nausea += attraction.nausea_rating
    user.happiness += attraction.happiness_rating
    user.save
  end

  def has_errors?
    errors = []
    if user.tickets < attraction.tickets
      errors << "You do not have enough tickets to ride the #{attraction.name}."
    end
    if user.height < attraction.min_height
      errors << "You are not tall enough to ride the #{attraction.name}."
    end
    @error = "Sorry. " + errors.join(' ')
    errors.length > 0
  end
end

class Ride < ActiveRecord::Base

  belongs_to :user
  belongs_to :attraction

  def take_ride
    if allowed?
      user.tickets -= attraction.tickets
      user.nausea += attraction.nausea_rating
      user.happiness += attraction.happiness_rating
      user.save
      @success = "Thanks for riding the #{attraction.name}!"
    else
      @errors.join(" ")
    end
  end

  def allowed?
    @errors = ["Sorry."]
    @errors << "You do not have enough tickets to ride the #{attraction.name}." if user.tickets < attraction.tickets
    @errors << "You are not tall enough to ride the #{attraction.name}." if user.height < attraction.min_height
    @errors.length <= 1 ? true : false
  end

end

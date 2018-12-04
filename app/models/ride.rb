class Ride < ActiveRecord::Base
  belongs_to :attraction
  belongs_to :user

  def take_ride
    attraction = Attraction.find(self.attraction_id)
    user = User.find(self.user_id)

    if too_short_and_too_broke?(user, attraction)
      "Sorry. You do not have enough tickets to ride the #{attraction.name}. You are not tall enough to ride the #{attraction.name}."
    elsif too_short?(user, attraction)
      "Sorry. You are not tall enough to ride the #{attraction.name}."
    elsif too_broke?(user, attraction)
      "Sorry. You do not have enough tickets to ride the #{attraction.name}."
    else
      user.tickets -= attraction.tickets
      user.nausea += attraction.nausea_rating
      user.happiness += attraction.happiness_rating
      user.save
      "Thanks for riding the #{attraction.name}!"
    end
  end

  def too_short?(user, attraction)
    user.height < attraction.min_height
  end

  def too_broke?(user, attraction)
    user.tickets < attraction.tickets
  end

  def too_short_and_too_broke?(user, attraction)
    user.height < attraction.min_height && user.tickets < attraction.tickets
  end

end

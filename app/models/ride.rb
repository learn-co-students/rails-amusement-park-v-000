class Ride < ActiveRecord::Base
  belongs_to :user
  belongs_to :attraction

  def take_ride
    @user = User.find_by(id: user_id)
    @attraction = Attraction.find_by(id: attraction_id)
    can_ride?(@user, @attraction)
  end

  def can_ride?(user, attraction)
    if attraction.tickets > user.tickets && attraction.min_height > user.height
      "Sorry. You do not have enough tickets to ride the #{@attraction.name}. You are not tall enough to ride the #{@attraction.name}."
    elsif attraction.tickets > user.tickets 
      "Sorry. You do not have enough tickets to ride the #{@attraction.name}."
    elsif attraction.min_height > user.height
      "Sorry. You are not tall enough to ride the #{@attraction.name}."
    else
      update_user(user, attraction)
    end
  end


  def update_user(user, attraction)
    user.tickets = user.tickets - attraction.tickets
    user.nausea = user.nausea + attraction.nausea_rating
    user.happiness = user.happiness + attraction.happiness_rating
    user.save
  end

end
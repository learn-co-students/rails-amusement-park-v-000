
class Ride < ActiveRecord::Base
  belongs_to :attraction
  belongs_to :user

  def take_ride
    @user = User.find_by(id: self.user_id)
    @attraction = Attraction.find_by(id: self.attraction_id)
    @user.happiness = @user.happiness + @attraction.happiness_rating
  end


end

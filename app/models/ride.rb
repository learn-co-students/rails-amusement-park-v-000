class Ride < ActiveRecord::Base
  belongs_to :attraction
  belongs_to :user

  def take_ride
    @user = User.find_by(id: self.user_id)
    @attraction = Attraction.find_by(id: self.attraction_id)
    if @user.tickets < @attraction.tickets
      errors[:base] << "You do not have enough tickets to ride the #{attraction.name}."
    end
    if @user.height < @attraction.min_height
      errors[:base] << "You are not tall enough to ride the Roller Coaster."
    end
    if errors[:base]
      "Sorry. " + errors[:base].join(" ")
    else
      @user.tickets -= @attraction.tickets
      @user.nausea += @attraction.nausea_rating
      @user.happiness += @attraction.happiness_rating
      @user.save
    end
  end

end

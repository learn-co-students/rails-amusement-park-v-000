class Ride < ActiveRecord::Base
  belongs_to :user
  belongs_to :attraction

  def take_ride
    @user = User.find(self.user_id)
    @attraction = Attraction.find(self.attraction_id)
    @user.tickets = @user.tickets - @attraction.tickets
    @user.nausea = @user.nausea + @attraction.nausea_rating
    @user.happiness = @user.happiness + @attraction.happiness_rating
    @user.save
    if @user.tickets < @attraction.tickets && @user.height < @attraction.min_height
      message = "Sorry. You do not have enough tickets to ride the #{attraction.name}. You are not tall enough to ride the #{attraction.name}."
    elsif @user.tickets < @attraction.tickets
      message = "Sorry. You do not have enough tickets to ride the #{attraction.name}."
    elsif @user.height < @attraction.min_height
      message = "Sorry. You are not tall enough to ride the #{attraction.name}."
    end
  end
end

class Ride < ActiveRecord::Base
  belongs_to :attraction
  belongs_to :user

  def take_ride
    @user = self.user#User.find(self.user_id)
    @attraction = self.attraction#Attraction.find(self.attraction_id)

    if @user.tickets < @attraction.tickets && @user.height < @attraction.min_height
      str = "Sorry. You do not have enough tickets to ride the #{@attraction.name}. You are not tall enough to ride the #{@attraction.name}."
    elsif @user.tickets < @attraction.tickets
      str = "Sorry. You do not have enough tickets to ride the #{@attraction.name}."
    elsif @user.height < @attraction.min_height
      str = "Sorry. You are not tall enough to ride the #{@attraction.name}."
    else
      tickets = @user.tickets - @attraction.tickets
      nausea = @user.nausea + @attraction.nausea_rating
      happiness = @user.happiness + @attraction.happiness_rating
      @user.update(tickets: tickets, nausea: nausea, happiness: happiness)
      str = "Thanks for riding the #{@attraction.name}!"
    end
    str
  end

end

class Ride < ActiveRecord::Base
require 'pry'
  belongs_to :user
  belongs_to :attraction

  def take_ride
    @attraction = self.attraction
    @user = self.user
    @user_tickets = self.user.tickets
    @attraction_tickets = self.attraction.tickets
    @user_height = self.user.height
    @attraction_min_height = self.attraction.min_height

    if @user_tickets < @attraction_tickets && @user_height < @attraction_min_height
       "Sorry. You do not have enough tickets to ride the #{@attraction.name}. You are not tall enough to ride the #{@attraction.name}."
    elsif  @user_tickets < @attraction_tickets
       "Sorry. You do not have enough tickets to ride the #{@attraction.name}."
    elsif @user_height < @attraction_min_height
       "Sorry. You are not tall enough to ride the #{@attraction.name}."
    else
      update_user
    "Thanks for riding the #{@attraction.name}!"
  end
end

def update_user
  @user.tickets = @user.tickets - @attraction.tickets
  @user.nausea = @user.nausea + @attraction.nausea_rating
  @user.happiness = @user.happiness + @attraction.happiness_rating
  @user.save
end

end

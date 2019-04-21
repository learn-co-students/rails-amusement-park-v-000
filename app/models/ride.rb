class Ride < ActiveRecord::Base
  belongs_to :user
  belongs_to :attraction

  def take_ride
    @user = self.user
    @attraction = self.attraction

    if @user.tickets < @attraction.tickets && @user.height < @attraction.min_height
      return "Sorry. You do not have enough tickets to ride the #{@attraction.name}. You are not tall enough to ride the #{@attraction.name}."
    elsif @user.tickets < @attraction.tickets
      return "Sorry. You do not have enough tickets to ride the #{@attraction.name}."
    elsif @user.height < @attraction.min_height
      return "Sorry. You are not tall enough to ride the #{@attraction.name}."
    else
      @user.tickets = @user.tickets - @attraction.tickets
      @user.nausea = @user.nausea + @attraction.nausea_rating
      @user.happiness = @user.happiness + @attraction.happiness_rating
      @user.save      
    end
  end
end

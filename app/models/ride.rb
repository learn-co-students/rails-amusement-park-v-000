class Ride < ActiveRecord::Base
  belongs_to :user
  belongs_to :attraction

  def take_ride
    @user = self.user
    @attraction = self.attraction

    if @user.tickets >= @attraction.tickets && @user.height >= @attraction.min_height
      @user.tickets -= @attraction.tickets
      @user.happiness += @attraction.happiness_rating
      @user.nausea += @attraction.nausea_rating
      @user.save
      return "Thanks for riding the #{@attraction.name}!"
    elsif @user.tickets >= @attraction.tickets
      return "Sorry. You are not tall enough to ride the #{@attraction.name}."
    elsif @user.height >= @attraction.min_height
      return "Sorry. You do not have enough tickets to ride the #{@attraction.name}."
    else
      return "Sorry. You do not have enough tickets to ride the #{@attraction.name}. You are not tall enough to ride the #{@attraction.name}."
    end
  end

  def enough_tickets?
    if self.user.tickets >= self.attraction.tickets
      return true
    else
      return false
    end
  end

  def tall_enough?
    if self.user.height >= self.attraction.min_height
      return true
    else
      return false
    end
  end

  def update_tickets
    self.user.tickets -= self.attraction.tickets
  end

  def update_mood
    self.user.happiness = self.attraction.happiness_rating
    self.user.nausea = self.attraction.nausea_rating
  end
end

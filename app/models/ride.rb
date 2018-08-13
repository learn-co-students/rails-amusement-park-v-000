class Ride < ActiveRecord::Base
  belongs_to :user
  belongs_to :attraction

  def take_ride
    @user = self.user
    if @user.height >= self.attraction.min_height && @user.tickets >= self.attraction.tickets
      @user.tickets = @user.tickets - self.attraction.tickets
      @user.nausea = @user.nausea + self.attraction.nausea_rating
      @user.happiness = @user.happiness + self.attraction.happiness_rating
      @user.rides << self
      @user.save
      return "success"
    elsif @user.height < self.attraction.min_height && @user.tickets < self.attraction.tickets
      return "short and no tickets"
    elsif @user.height < self.attraction.min_height
      return "short"
    elsif @user.tickets < self.attraction.tickets
      return "no tickets"
    end
  end

end

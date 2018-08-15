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
      return "Thanks for riding the #{self.attraction.name}!"
    elsif @user.height < self.attraction.min_height && @user.tickets < self.attraction.tickets
      return "Sorry. You do not have enough tickets to ride the #{self.attraction.name}. You are not tall enough to ride the #{self.attraction.name}."
    elsif @user.height < self.attraction.min_height
      return  "Sorry. You are not tall enough to ride the #{self.attraction.name}."
    elsif @user.tickets < self.attraction.tickets
      return  "Sorry. You do not have enough tickets to ride the #{self.attraction.name}."
    end
  end

end

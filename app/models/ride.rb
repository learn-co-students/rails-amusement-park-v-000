class Ride < ActiveRecord::Base
  belongs_to :attraction
  belongs_to :user

  def take_ride
    @user = self.user
    @attraction = self.attraction
    if enough_tickets && correct_height
      ride_attraction
    elsif !enough_tickets && !correct_height
      "Sorry. You do not have enough tickets to ride the #{attraction.name}. You are not tall enough to ride the #{attraction.name}."
    elsif !enough_tickets
      "Sorry. You do not have enough tickets to ride the #{attraction.name}."
    elsif !correct_height
      "Sorry. You are not tall enough to ride the #{attraction.name}."
    end
  end

  def enough_tickets
    attraction.tickets <= @user.tickets
  end

  def correct_height
    attraction.min_height <= @user.height
  end

  def ride_attraction
    @user.tickets = @user.tickets - @attraction.tickets
    @user.nausea = @user.nausea + @attraction.nausea_rating
    @user.happiness = @user.happiness + @attraction.happiness_rating

    @user.save
    "Thanks for riding the #{self.attraction.name}!"
  end
end

class Ride < ActiveRecord::Base
  belongs_to :user
  belongs_to :attraction

  def take_ride
    @user = self.user
    @attraction = self.attraction
    if not_enough_tickets && not_tall_enough
      return "Sorry. You do not have enough tickets to ride the #{@attraction.name}. You are not tall enough to ride the #{@attraction.name}."
    elsif not_enough_tickets
      return "Sorry. You do not have enough tickets to ride the #{@attraction.name}."
    elsif not_tall_enough
      return "Sorry. You are not tall enough to ride the #{@attraction.name}."
    else
      update_user
      return "Thanks for riding the #{@attraction.name}!"
    end
  end

  def not_enough_tickets
    @user.tickets < @attraction.tickets
  end

  def not_tall_enough
    @user.height < @attraction.min_height
  end

  def update_user
    @user.tickets = @user.tickets - @attraction.tickets
    @user.nausea = @user.nausea + @attraction.nausea_rating
    @user.happiness = @user.happiness + @attraction.happiness_rating
    @user.save
  end



end

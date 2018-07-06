class Ride < ActiveRecord::Base
  belongs_to :attraction
  belongs_to :user

  def take_ride
    binding.pry
    if tall_enough? && enough_tickets?
      user_takes_ride
    elsif !tall_enough? && enough_tickets?
      "Sorry. " + ride_height_error_message
    elsif !enough_tickets? && tall_enough?
      "Sorry. " + ride_ticket_error_message
    else
      "Sorry. " + ride_ticket_error_message + " " + ride_height_error_message
    end
  end

  def user_takes_ride
    update_user_tickets
    update_user_hapiness
    update_user_nausea
    self.user.update(
      :happiness => @user_hapiness,
      :nausea => @user_nausea,
      :tickets => @user_tickets
    )
  end

  def update_user_hapiness
    @user_hapiness = self.user.happiness + self.attraction.happiness_rating
    return @user_hapiness
  end

  def update_user_tickets
    @user_tickets = self.user.tickets - self.attraction.tickets
    return @user_tickets
  end

  def update_user_nausea
    @user_nausea = self.user.nausea + self.attraction.nausea_rating
    return @user_nausea
  end

  def tall_enough?
    tall_enough = false
    self.user.height > self.attraction.min_height ? tall_enough = true : tall_enough = false
  end

  def enough_tickets?
    enough_tickets = false
    self.user.tickets > self.attraction.tickets ? enough_tickets = true : enough_tickets = false
  end


  def ride_ticket_error_message
   "You do not have enough tickets to ride the #{attraction.name}."
  end

  def ride_height_error_message
    "You are not tall enough to ride the #{attraction.name}."
  end



end

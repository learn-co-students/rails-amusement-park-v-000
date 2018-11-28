class Ride < ActiveRecord::Base
  belongs_to :attraction
  belongs_to :user

  def take_ride
    # if check tickets && check height pass, then
      # update the ticket count
      # update nausea
      # update happiness
    # else, display error messages:
      # Sorry. #{deny_entry_reason}

    if able_to_ride?
      update_user_tickets
      make_nauseous
      make_happy
      self.save
    else
      show_reason
    end

  end

  private

  def able_to_ride?
    !too_short? && !not_enough_tickets?
  end

  def show_reason
    reason = "Sorry."

    if not_enough_tickets?
      reason += " You do not have enough tickets to ride the #{self.attraction.name}."
    end

    if too_short?
      reason += " You are not tall enough to ride the #{self.attraction.name}."
    end

    reason
  end

  def too_short?
    # check User#height against min_height of Attraction
    self.user.height < self.attraction.min_height
  end

  def not_enough_tickets?
    #check User#tickets against Attraction#tickets
    self.user.tickets < self.attraction.tickets
  end

  def update_user_tickets
    #update User#tickets by tickets required for Attraction
    self.user.tickets -= self.attraction.tickets
  end

  def make_nauseous
    #update User#nausea by nausea_rating of Attraction
    self.user.nausea += self.attraction.nausea_rating
  end

  def make_happy
    #update User#happiness by nausea_rating of Attraction
    self.user.happiness += self.attraction.happiness_rating
  end
end

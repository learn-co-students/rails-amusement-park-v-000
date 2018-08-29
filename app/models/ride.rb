class Ride < ActiveRecord::Base
  belongs_to :user
  belongs_to :attraction

  def take_ride
    @user = User.find_by(id: self.user_id)
    @attraction = Attraction.find_by(id: self.attraction_id)

    if !self.enough_tickets? && !self.tall_enough?
      return "Sorry. You do not have enough tickets to ride the #{attraction.name}. You are not tall enough to ride the #{attraction.name}."
    elsif !self.enough_tickets?
      return "Sorry. You do not have enough tickets to ride the #{attraction.name}."
    elsif !self.tall_enough?
      return "Sorry. You are not tall enough to ride the #{attraction.name}."
    else
      self.take_tickets
      self.nauseate
      self.make_happy
      return "Thanks for riding the #{attraction.name}!"
    end
  end

  def enough_tickets?
    @user.tickets > @attraction.tickets
  end

  def tall_enough?
    @user.height > @attraction.min_height
  end

  def take_tickets
    new_tickets = @user.tickets - @attraction.tickets
    @user.update(tickets: new_tickets)
  end

  def nauseate
    @user.nausea = @user.nausea + @attraction.nausea_rating
    @user.update(nausea: @user.nausea)
  end

  def make_happy
    @user.happiness = @user.happiness + @attraction.happiness_rating
    @user.update(happiness: @user.happiness)
  end
end

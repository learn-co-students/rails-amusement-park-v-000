class Ride < ActiveRecord::Base
  belongs_to :attraction
  belongs_to :user


  def take_ride
    @user = self.user
    @attraction = self.attraction

    if @user.tickets.to_i < @attraction.tickets.to_i  && @user.height.to_i < @attraction.min_height.to_i
      ride_invalid
    elsif @user.height.to_i < @attraction.min_height.to_i
      height_invalid
    elsif @user.tickets.to_i < @attraction.tickets.to_i
      tickets_invalid
    else
      @user.update(tickets: ticket_current, nausea: nausea_current, happiness: happiness_current)
    end
  end


  def ticket_current
    ticket_current = @user.tickets.to_i - @attraction.tickets.to_i
  end

  def nausea_current
    nausea_current = @user.nausea.to_i + @attraction.nausea_rating.to_i
  end

  def happiness_current
    happiness_current = @user.happiness.to_i + @attraction.happiness_rating.to_i
  end

  def tickets_invalid
    "Sorry. You do not have enough tickets to ride the #{self.attraction.name}."
  end

  def height_invalid
    "Sorry. You are not tall enough to ride the #{self.attraction.name}."
  end

  def ride_invalid
    "Sorry. You do not have enough tickets to ride the #{attraction.name}. You are not tall enough to ride the #{self.attraction.name}."
  end

end

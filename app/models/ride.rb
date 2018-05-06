class Ride < ActiveRecord::Base
  belongs_to :attraction
  belongs_to :user

  def take_ride
    if check_user_tickets && check_user_height
      get_on_ride
    else
      display_message
    end
  end


  def check_user_height
    self.user.height >= self.attraction.min_height ? true : false
  end

  def check_user_tickets
    self.user.tickets >= self.attraction.tickets ? true : false
  end

  def display_message
    message = []
    if check_user_tickets == false
      message << "Sorry. You do not have enough tickets to ride the #{self.attraction.name}."
    end
    if message.count == 1 && check_user_height == false
      message << "You are not tall enough to ride the #{self.attraction.name}."
    elsif message.count == 0 && check_user_height == false
      message << "Sorry. You are not tall enough to ride the #{self.attraction.name}."
    end
    if message.count == 2
      message.join(" ")
    else
      message.first
    end
  end

  def get_on_ride
    new_tickets = self.user.tickets - self.attraction.tickets
    new_happiness = self.user.happiness + self.attraction.happiness_rating
    new_nausea = self.user.nausea + self.attraction.nausea_rating
    self.user.update(:tickets => new_tickets, :happiness => new_happiness, :nausea => new_nausea)
    "Thanks for riding the #{self.attraction.name}!"
  end

end

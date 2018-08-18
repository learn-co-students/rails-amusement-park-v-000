class Ride < ActiveRecord::Base
  belongs_to :user
  belongs_to :attraction

  validate :not_tall_enough_for_ride
  validate :not_enough_tickets_for_ride

  def not_tall_enough_for_ride
    if self.user.height && self.attraction.min_height
      if self.user.height < self.attraction.min_height
        errors[:base] << "Sorry. You are not tall enough to ride the #{self.attraction.name}."
      end
    end
  end

  def not_enough_tickets_for_ride
    if self.user.tickets && self.attraction.tickets
      if self.user.tickets < self.attraction.tickets
        errors[:base] << "Sorry. You do not have enough tickets to ride the #{self.attraction.name}."
      end
    end
  end

  def after_ride
    self.user.tickets -= self.attraction.tickets
    self.user.nausea += self.attraction.nausea_rating
    self.user.happiness += self.attraction.happiness_rating
    self.user.save
  end

  def take_ride
    user = User.find(self.user.id)
    attraction = Attraction.find(self.attraction.id)

    if user.height < attraction.min_height && user.tickets < attraction.tickets
      "Sorry. You do not have enough tickets to ride the #{attraction.name}. You are not tall enough to ride the #{attraction.name}."
    elsif user.height < attraction.min_height
      "Sorry. You are not tall enough to ride the #{attraction.name}."
    elsif user.tickets < attraction.tickets
      "Sorry. You do not have enough tickets to ride the #{attraction.name}."
    else
      user.tickets -= attraction.tickets
      user.nausea += attraction.nausea_rating
      user.happiness += attraction.happiness_rating
      user.save
      "Thanks for riding the #{attraction.name}!"
    end
  end

end

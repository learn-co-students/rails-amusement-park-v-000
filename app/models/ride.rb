class Ride < ActiveRecord::Base
  belongs_to :user
  belongs_to :attraction

  def attraction_name
    self.attraction.name
  end

  def tall_enough
    self.user.height >= self.attraction.min_height
  end

  def enough_tickets
    self.user.tickets >= self.attraction.tickets
  end

  def message
    if !tall_enough && !enough_tickets
      "Sorry. You do not have enough tickets to ride the #{attraction_name}. You are not tall enough to ride the #{attraction_name}."
    elsif !tall_enough
      "Sorry. You are not tall enough to ride the #{attraction_name}."
    elsif !enough_tickets
      "Sorry. You do not have enough tickets to ride the #{attraction_name}."
    else
      "Thanks for riding the #{attraction_name}!"
    end
  end

  def take_ride
    if self.user && self.attraction
      if tall_enough && enough_tickets
        new_tickets = self.user.tickets - self.attraction.tickets
        new_nausea = self.user.nausea + self.attraction.nausea_rating
        new_happiness = self.user.happiness + self.attraction.happiness_rating
        self.user.update(
          tickets: new_tickets,
          nausea: new_nausea,
          happiness: new_happiness
        )
        message
      else
        message
      end
    end
  end


        #
        #   self.user.happiness += self.attraction.happiness_rating

  # def not_tall_enough_for_ride
  #   if self.user.height && self.attraction.min_height
  #     if self.user.height < self.attraction.min_height
  #       "Sorry. You are not tall enough to ride the #{self.attraction.name}."
  #     end
  #   end
  # end
  #
  # def not_enough_tickets_for_ride
  #   if self.user.tickets && self.attraction.tickets
  #     if self.user.tickets < self.attraction.tickets
  #       "Sorry. You do not have enough tickets to ride the #{self.attraction.name}."
  #     end
  #   end
  # end

  # def after_ride
  #   self.user.tickets -= self.attraction.tickets
  #   self.user.nausea += self.attraction.nausea_rating
  #   self.user.happiness += self.attraction.happiness_rating
  #   self.user.save
  # end

  # def take_ride
  #   user = User.find(self.user.id)
  #   attraction = Attraction.find(self.attraction.id)
  #
  #   if user.height < attraction.min_height && user.tickets < attraction.tickets
  #     "Sorry. You do not have enough tickets to ride the #{attraction.name}. You are not tall enough to ride the #{attraction.name}."
  #   elsif user.height < attraction.min_height
  #     "Sorry. You are not tall enough to ride the #{attraction.name}."
  #   elsif user.tickets < attraction.tickets
  #     "Sorry. You do not have enough tickets to ride the #{attraction.name}."
  #   else
  #     user.tickets -= attraction.tickets
  #     user.nausea += attraction.nausea_rating
  #     user.happiness += attraction.happiness_rating
  #     user.save
  #     "Thanks for riding the #{attraction.name}!"
  #   end
  # end

end

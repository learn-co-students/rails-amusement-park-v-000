class Ride < ActiveRecord::Base
  belongs_to :attraction
  belongs_to :user


  def take_ride
    if self.user.tickets < self.attraction.tickets && self.user.height < self.attraction.min_height
      "Sorry. You do not have enough tickets to ride the #{self.attraction.name}. You are not tall enough to ride the #{attraction.name}."
    elsif self.user.tickets < self.attraction.tickets
      "Sorry. You do not have enough tickets to ride the #{self.attraction.name}."
    elsif self.user.height < self.attraction.min_height
      "Sorry. You are not tall enough to ride the #{self.attraction.name}."
    else #user.tickets >= attraction.tickets && user.height >= attraction.min_height
      update_user
      "Thank you for riding the #{self.attraction.name}."
      binding.pry
    end
  end

    def update_user

      self.user.update(
        tickets: self.user.tickets - self.attraction.tickets,
        nausea: self.user.nausea + self.attraction.nausea_rating,
        happiness: self.user.happiness + self.attraction.happiness_rating
        )

      # new_balance = self.user.tickets - self.attraction.tickets
      # self.user.tickets = new_balance
      #
      # new_nausea_level = self.user.nausea + self.attraction.nausea_rating
      # self.user.nausea = new_nausea_level
      #
      # new_happiness_level = self.user.happiness + self.attraction.happiness_rating
      # self.user.happiness = new_happiness_level

      #self.user.save
      

    end
end

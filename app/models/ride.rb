class Ride < ActiveRecord::Base
  belongs_to :user
  belongs_to :attraction

  def take_ride
    if self.attraction.min_height > self.user.height && self.attraction.tickets > self.user.tickets
      record.errors[:tickets] << "Sorry. You do not have enough tickets to ride the #{ride.attraction.name}."
      record.errors[:height] << "Sorry. You are not tall enought to ride the #{attraction.name}."
    elsif self.attraction.min_height > self.user.height
      record.errors[:height] << "Sorry. You are not tall enought to ride the #{attraction.name}."
    elsif self.attraction.tickets > self.user.tickets
      record.errors[:tickets] << "Sorry. You do not have enough tickets to ride the #{ride.attraction.name}."
    else
      self.user.update(
        :tickets => self.user.tickets - self.attraction.tickets,
        :nausea => self.user.nausea + self.attraction.nausea_rating,
        :happiness => self.user.happiness + self.attraction.happiness_rating
      )

    end
  end

end

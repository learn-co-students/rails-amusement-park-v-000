class Ride < ActiveRecord::Base
  belongs_to :attraction
  belongs_to :user

  def take_ride
    fail_case1 = self.user.tickets < self.attraction.tickets
    fail_case2 = self.user.height < self.attraction.min_height
    if fail_case1 && fail_case2
      "Sorry. You do not have enough tickets to ride the #{self.attraction.name}. You are not tall enough to ride the #{self.attraction.name}."
    elsif fail_case1 && !fail_case2
      "Sorry. You do not have enough tickets to ride the #{self.attraction.name}."
    elsif !fail_case1 && fail_case2
      "Sorry. You are not tall enough to ride the #{self.attraction.name}."
    else
      self.user.tickets -= self.attraction.tickets
      self.user.nausea += self.attraction.nausea_rating
      self.user.happiness += self.attraction.happiness_rating
      self.user.save
      "Thanks for riding the #{self.attraction.name}!"
    end
  end
end

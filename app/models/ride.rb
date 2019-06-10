class Ride < ActiveRecord::Base
  belongs_to :user
  belongs_to :attraction

  def take_ride
    #if the user has enough tickets, they can ride. if not they get a messsaage
    #if user is tall enough, they can ride. if not, message
    if self.user.height < self.attraction.min_height && self.user.tickets < self.attraction.tickets
      "Sorry. You do not have enough tickets to ride the #{attraction.name}. You are not tall enough to ride the #{attraction.name}."
    elsif self.user.height < self.attraction.min_height
      "Sorry. You are not tall enough to ride the #{attraction.name}."
    elsif self.user.tickets < self.attraction.tickets
      "Sorry. You do not have enough tickets to ride the #{attraction.name}."
    else
      self.user.tickets -= self.attraction.tickets
      self.user.nausea += self.attraction.nausea_rating
      self.user.happiness += self.attraction.happiness_rating
      user.save
      "Thanks for riding the #{self.attraction.name}!"
    end
  end

end

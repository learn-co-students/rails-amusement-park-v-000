class Ride < ActiveRecord::Base
  belongs_to :user
  belongs_to :attraction

  def take_ride
    if !ticket_req && !height_req
      "Sorry. You do not have enough tickets to ride the #{self.attraction.name}. You are not tall enough to ride the #{self.attraction.name}."
    elsif !ticket_req
      "Sorry. You do not have enough tickets to ride the #{self.attraction.name}."
    elsif !height_req
      "Sorry. You are not tall enough to ride the #{self.attraction.name}."
    else
      update_user
      "Thanks for riding the #{self.attraction.name}!"
    end
  end

  def ticket_req
    self.user.tickets >= self.attraction.tickets
  end

  def height_req
    self.user.height >= self.attraction.min_height
  end

  def update_user
    self.user.tickets -= self.attraction.tickets
    self.user.nausea += self.attraction.nausea_rating
    self.user.happiness += self.attraction.happiness_rating
    self.user.save
  end
end

class Ride < ActiveRecord::Base
  belongs_to :user
  belongs_to :attraction

  def take_ride
    if  enough_tickets and min_height
      self.user.update(
      :happiness => self.user.happiness += attraction.happiness_rating,
      :tickets => self.user.tickets -= attraction.tickets,
      :nausea => self.user.nausea += attraction.nausea_rating
      )
      "Thanks for riding the #{self.attraction.name}!"
    else
      requirements = ""
      requirements += "Sorry. You do not have enough tickets to ride the #{attraction.name}."   if !enough_tickets
      # checks if other requirements have not been meet and changes syntax
      requirements+= "#{" " if requirements != ""}#{"Sorry. " if requirements == ""}You are not tall enough to ride the #{attraction.name}."  if !min_height
      requirements
    end
  end

  def enough_tickets
    self.attraction.tickets < self.user.tickets
  end


  def min_height
    self.attraction.min_height < self.user.height
  end
end

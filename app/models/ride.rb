class Ride < ActiveRecord::Base
  
  belongs_to :user 
  belongs_to :attraction 
  
  def take_ride 
    
    if enough_tickets && tall_enough
      update_user
      "Thanks for riding the #{self.attraction.name}!"
    elsif !enough_tickets && tall_enough
      "Sorry. You do not have enough tickets to ride the #{self.attraction.name}."
    elsif enough_tickets && !tall_enough
      "Sorry. You are not tall enough to ride the #{self.attraction.name}."
    else 
      "Sorry. You do not have enough tickets to ride the #{self.attraction.name}. You are not tall enough to ride the #{self.attraction.name}."
    end 
    
  end 
  
  def enough_tickets
    self.user.tickets >= self.attraction.tickets ? true : false
  end 
  
  def tall_enough
    self.user.height >= self.attraction.min_height ? true : false 
  end 
  
  def update_user
    updated_happiness = self.user.happiness + self.attraction.happiness_rating
    
    updated_nausea = self.user.nausea + self.attraction.nausea_rating
    
    updated_ticket = self.user.tickets - self.attraction.tickets
    
    self.user.update(:happiness => updated_happiness, :nausea => updated_nausea, :tickets => updated_ticket)
  end 
    
  
end

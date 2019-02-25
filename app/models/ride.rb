class Ride < ActiveRecord::Base

  belongs_to :attraction
  belongs_to :user

  def take_ride
    if too_short?
      height_issue
    elsif not_enough_tickets?
      ticket_issue
    else
      update_user_tickets
      make_happy
      make_nauseous
      message = ""
    end
   end

   private

   def too_short?
      self.user.height < self.attraction.min_height
   end
   def height_issue
     "You are not tall enough to ride the #{self.attraction.name}."
   end

   def not_enough_tickets?
      self.user.tickets < self.attraction.tickets
   end
   def ticket_issue
    "You do not have enough tickets to ride the #{self.attraction.name}."
   end


   def update_user_tickets
      self.user.tickets -= self.attraction.tickets
      self.user.save
   end
   def make_happy
      self.user.happiness += self.attraction.happiness_rating
      self.user.save
   end
   def make_nauseous
      self.user.nausea += self.attraction.nausea_rating
      self.user.save
   end

end

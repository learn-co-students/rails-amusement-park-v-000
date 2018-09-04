class Ride < ActiveRecord::Base
  belongs_to :user
  belongs_to :attraction

  def enough_tickets?
     if self.user.tickets >= self.attraction.tickets
        true
      else
        errors.add(:tickets, "You do not have enough tickets to ride the #{attraction.name}.")
        false
      end
    end

    def tall_enough?
       if self.user.height >= self.attraction.min_height
          true
        else
          errors.add(:height, "You are not tall enough to ride the #{attraction.name}.")
          false
        end
      end

  def take_ride
    if tall_enough? && enough_tickets?
      user.tickets -= attraction.tickets
      user.nausea += attraction.nausea_rating
      user.happiness += attraction.happiness_rating
      user.save
    else
      errors.clear
      enough_tickets?
      tall_enough?
      @message = "Sorry."
      errors.each do |key, e|
        @message << " #{e}"
      end
      @message
    end
  end

end

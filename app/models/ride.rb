class Ride < ActiveRecord::Base
  belongs_to :attraction
  belongs_to :user

  def take_ride
    # binding.pry
    if (self.user.height < self.attraction.min_height) && (self.user.tickets < self.attraction.tickets)
      # binding.pry
        @message = "Sorry. You do not have enough tickets to ride the #{self.attraction.name}. You are not tall enough to ride the #{self.attraction.name}."
    elsif self.user.height < self.attraction.min_height
        @message = "Sorry. You are not tall enough to ride the #{self.attraction.name}."
    elsif self.user.tickets < self.attraction.tickets
        @message = "Sorry. You do not have enough tickets to ride the #{self.attraction.name}."
    else
      # binding.pry
      # self.user.tickets = (self.user.tickets - self.attraction.tickets)
      # self.user.save
      self.user.update(:tickets => (self.user.tickets - self.attraction.tickets)) unless self.user.tickets == nil

      self.user.update(:nausea => (self.user.nausea + self.attraction.nausea_rating))  unless self.user.nausea == nil

      self.user.update(:happiness => (self.user.happiness + self.attraction.happiness_rating))  unless self.user.happiness == nil
      # binding.pry

      @message = "Thanks for riding the #{self.attraction.name}!"

# binding.pry
    end
  end
end

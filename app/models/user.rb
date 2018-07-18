class User < ActiveRecord::Base
  has_many :rides
  has_many :attractions, through: :rides
  has_secure_password




  def ticket_ride(params)
    @tickets = Attraction.find(params[:attraction]).tickets
      if self.tickets > @tickets
        self.tickets = self.tickets - @tickets
        self.save
      else
        false
      end
  end


  def tall_enough(params)
    @height = Attraction.find(params[:attraction]).min_height
    self.height > @height.to_i
  end

#   def admin=(admin)
#     if admin == 1 || admin == true
#     @admin = true
#   end
# end
#
# def admin
#   @admin
# end

  def mood
    if self.admin
      mood = nil
    elsif self.happiness > self.nausea
      'happy'
    else
      'sad'
    end

  end


end

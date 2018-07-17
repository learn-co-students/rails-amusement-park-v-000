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


  def mood(ride_id)
    if self.admin
      mood = nil
    elsif Attraction.all.count > 0
      @ride = Attraction.find(ride_id)
      self.happiness = @ride.happiness_rating - @ride.nausea_rating
      happy_lvl
    else
      happy_lvl
    end
  end

  def happy_lvl
    if self.happiness >= 3
      'happy'
    else
      'sad'
    end
  end


end

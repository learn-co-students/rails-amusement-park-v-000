class User < ActiveRecord::Base
  has_many :rides
  has_many :attractions, through: :rides
  has_secure_password



  def self.take_ride(params)
    binding.pry
    ticket_ride
    tall_enough
    mood
  end

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

  def mood
    if self.admin == true || self.admin == 1
      mood = nil
    elsif self.happiness > self.nausea
      'happy'
    else
      'sad'
    end

  end


end

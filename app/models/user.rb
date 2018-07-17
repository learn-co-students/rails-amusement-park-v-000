class User < ActiveRecord::Base
  has_many :rides
  has_many :attractions, through: :rides
  has_secure_password

  def ticket_ride(params)
    self.tickets = self.tickets - Attraction.find(params[:attraction]).tickets
    self.save
  end


  def mood(rating)
    # binding.pry
    # @ride = Attraction.find(id)
    # self.nausea = self.nausea - @ride.happiness_rating
    self.happiness = rating
    self.save
    if self.happiness > 3
      'happy'
    else
      'sad'
    end
  end


end

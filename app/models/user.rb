class User < ActiveRecord::Base
  has_many :rides
  has_many :attractions, through: :rides
  has_secure_password

  def ticket_ride(params)
    self.tickets = self.tickets - Attraction.find(params[:attraction]).tickets
    self.save
  end


  def mood(happy)
    if happy == nil
      return nil
    elsif self.happiness > self.nausea
      'happy'
    else
      'sad'
    end
  end


end

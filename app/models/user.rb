class User < ActiveRecord::Base
  has_secure_password
  has_many :rides
  has_many :attractions, through: :rides

  def mood
    if my_happiness > my_nausea
      return "happy"
    else
      return "sad"
    end
  end

  def my_happiness
    self.happiness
  end

  def my_nausea
    self.nausea
  end

  def my_tickets
    self.tickets
  end

  def my_height
    self.height
  end

  def enough_tickets
    Attraction.attraction_tickets < self.my_tickets
  end


end

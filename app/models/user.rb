class User < ActiveRecord::Base
  has_secure_password
  has_many :rides
  has_many :attractions, through: :rides

  def mood
    if happiness > nausea
      return "happy"
    else
      return "sad"
    end
  end

  # def my_happiness
  #   self.happiness
  # end
  #
  # def my_nausea
  #   self.nausea
  # end

  # def my_tickets
  #   self.tickets
  # end
  #
  # def my_height
  #   self.height
  # end

  def enough_tickets
    self..attraction_tickets < User.my_tickets
  end


end

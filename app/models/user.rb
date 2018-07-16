class User < ActiveRecord::Base
  has_many :rides
  has_many :attractions, through: :rides
  has_secure_password

  def mood(happy)
    binding.pry
    if happy > self.nausea
      'happy'
    else
      'sad'
    end
  end


end

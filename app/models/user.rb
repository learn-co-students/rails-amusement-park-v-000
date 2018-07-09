class User < ActiveRecord::Base
  has_secure_password

  has_many :rides
  has_many :attractions, through: :rides

  def mood
    # self.nausea > self.happiness ? "sad" : "happy"
    # ternary (condition) ? (true_return_value) : (false_return_value)
    if self.happiness && self.nausea
    if self.happiness < self.nausea
      mood = 'sad'
    else
      mood = 'happy'
    end
   end
  end

end

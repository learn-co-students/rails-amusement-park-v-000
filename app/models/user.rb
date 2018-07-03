class User < ActiveRecord::Base
  has_secure_password

  has_many :rides
  has_many :attractions, through: :rides

  def mood
     self.nausea > self.happiness ? "sad" : "happy"
      # ternary (condition) ? (true_return_value) : (false_return_value)
  end

end

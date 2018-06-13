class User < ActiveRecord::Base
  has_secure_password
  has_many :rides
  has_many :attractions, through: :rides



  def mood
    #returns sad when the user is more nauseaous than happy, or happy when the opposite
    #binding.pry
    if self.nausea.present? && self.happiness.present?
      if self.nausea > self.happiness
        'sad'
      else
        'happy'
      end
    else
        "undetermined"
    end
  end



end

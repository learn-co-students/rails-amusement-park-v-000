class User < ActiveRecord::Base
  has_many :rides
  has_many :attractions, through: :rides
  validates :password, presence: true
  def mood
    if self.happiness
      if self.happiness > self.nausea
        "happy"
      elsif self.happiness < self.nausea
        "sad"
      end
    end
  end


end


#User is not valid without a password
#User defaults to admin => false
#User has a method 'mood' that returns 'sad' when the user is more nauseous than happy
#User has a method 'mood' that returns 'happy' when the user is more happy than nauseous

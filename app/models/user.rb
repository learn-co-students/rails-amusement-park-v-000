class User < ActiveRecord::Base
  has_secure_password
  validates :name, uniqueness: true

  has_many :rides
  has_many :attractions, through: :rides

  def mood
    if self.nausea != nil && self.happiness != nil
     if self.nausea > self.happiness
      "sad"
      else
        "happy"
      end
    else
      "blank mood"
    end
  end


end

class User < ActiveRecord::Base
  has_secure_password
  has_many :rides
  has_many :attractions, through: :rides

  validates_presence_of :name

  def mood
    #need cawffee
    begin
      if self.nausea > self.happiness
        return 'sad'
      elsif self.nausea < self.happiness
        return 'happy'
      end
    rescue
      'no'
    end
  end

end

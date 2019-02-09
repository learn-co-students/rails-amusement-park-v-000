class User < ActiveRecord::Base
    validates :password, presence: true
    has_many :rides
    has_many :attractions, through: :rides 

    def mood
        mood = 'normal'
        if self.happiness > self.nausea
            mood = 'happy'
        else
            mood = 'sad'
        end
        mood
    end

end

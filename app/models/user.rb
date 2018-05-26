class User < ApplicationRecord
    has_many :rides
    has_many :attractions, through: :rides

    validates :name, :password, :nausea, :happiness, :tickets, :height,   presence: true

    def mood
        if nausea > happiness
            mood = "sad"
        else 
            mood = "happy"
            # what about equal? 
        end
    end
end

class User < ActiveRecord::Base
    has_secure_password
    has_many :rides
    has_many :attractions, through: :rides

    def mood
        unless admin
            nausea > happiness ? "sad" : "happy"
        end
    end
end

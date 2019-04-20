class User < ActiveRecord::Base
  has_many :rides
    has_many :attractions, through: :rides
    has_secure_password

    def mood
        unless admin
            happiness > nausea ? 'happy' : 'sad'
        end
    end 
end

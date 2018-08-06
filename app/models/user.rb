class User < ActiveRecord::Base
    has_secure_password 
    has_many :rides
    has_many :attractions, through: :rides

    def mood
       nauseous > happy ? "sad" : "happy"
    end


end

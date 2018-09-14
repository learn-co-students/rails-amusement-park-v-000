class User < ActiveRecord::Base
    has_many :rides
    has_many :attractions, through: :rides

    validates_presence_of :password
    has_secure_password

    def mood
        if nausea && happiness
            nausea > happiness ? "sad" : "happy"
        end
    end

end

class User < ActiveRecord::Base
    has_secure_password
   # validates :password, presence: true

    has_many :rides
    has_many :attractions, through: :rides

    def mood
       
        if nausea > happiness
            return "sad"
        else
            return "happy"
        end
    end

end

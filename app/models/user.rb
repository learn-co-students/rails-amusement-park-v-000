class User < ActiveRecord::Base
    has_many :rides
    has_many :attractions, through: :rides
    has_secure_password

    def mood 
        if happiness && nausea
            if happiness > nausea
                "happy"
            elsif happiness < nausea
                "sad"
            else
            end
        end
    end
end

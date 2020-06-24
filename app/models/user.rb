class User < ApplicationRecord
    has_many :rides 
    has_many :attractions, through: :rides
    has_secure_password


    def mood 
        if nausea > happiness
             "sad"
        elsif nausea < happiness
             "happy"
        end
    end

end

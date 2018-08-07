class User < ActiveRecord::Base
    has_secure_password 
    validates :name, { presence: true, uniqueness: true }

    has_many :rides
    has_many :attractions, through: :rides

    def mood
        if !nausea
            "happy"
        elsif !happiness
            "sad"
        else
            nausea > happiness ? "sad" : "happy"
        end
    end


end

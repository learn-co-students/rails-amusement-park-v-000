class User < ActiveRecord::Base
    has_secure_password
    has_many :rides
    has_many :attractions, through: :rides

    #validates :name, presence: true
    #validates :height, presence: true
    #validates :tickets, presence: true
    #validates :happiness, presence: true
    #validates :nausea, presence: true

    def mood
        if nausea? && happiness?
            if nausea > happiness
                "sad" 
            else 
                "happy"
            end
        else 
            "missing rating"
        end 
    end 

end

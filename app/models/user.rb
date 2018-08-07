class User < ActiveRecord::Base
    has_secure_password 
    validates :name, { presence: true, uniqueness: true }

    has_many :rides
    has_many :attractions, through: :rides

    def mood
       nausea > happiness ? "sad" : "happy"
    end


end

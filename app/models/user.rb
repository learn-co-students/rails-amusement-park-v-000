class User < ActiveRecord::Base
    has_many :rides
    has_many :attractions, through: :rides

    has_secure_password

    validates_presence_of :name, message: "Username is required."
    validates_uniqueness_of :name
    validates_presence_of :password, message: "Password is required.", on: :create

    def mood
        if self.happiness && self.nausea
            self.happiness >= self.nausea ? "happy" : "sad"
        else
            ""
        end
    end
end

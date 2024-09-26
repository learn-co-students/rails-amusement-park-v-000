class User < ActiveRecord::Base
    has_many :rides
    has_many :attractions, :through => :rides 
    validates :password, presence: true

    def mood 
        unless admin
            self.happiness > self.nausea ? "happy" : "sad"
        end
    end
end

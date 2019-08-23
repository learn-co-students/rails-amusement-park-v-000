class User < ActiveRecord::Base
    has_many :rides
    has_many :attractions, through: :rides
    has_secure_password

    def mood
        if self.happiness < self.nausea
            "sad"
        else
            "happy"
        end
    end

    # make admin default to false in new/edit form
end

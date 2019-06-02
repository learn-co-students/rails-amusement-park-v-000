class User < ActiveRecord::Base
    has_secure_password
    has_many :rides
    has_many :attractions, through: :rides

    def mood
        binding.pry
        if self.nausea.blank? || self.happiness.blank?
            ""
        elsif self.nausea > self.happiness
            "sad"
        elsif self.happiness > self.nausea
            "happy"
        end
    end
end

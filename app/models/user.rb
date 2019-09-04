class User < ActiveRecord::Base
    has_secure_password
    has_many :rides
    has_many :attractions, through: :rides

    def mood
     # binding.pry
         if self.nausea > self.happiness
             "sad"
            else
            "happy"
         end
    end

    def create_standard_user
        redirect_to 'signin'
    end
end

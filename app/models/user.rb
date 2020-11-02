class User < ActiveRecord::Base
    has_secure_password

    has_many :rides
    has_many :attractions, through: :rides

    def mood
      #  self.nausea > self.happiness ? "sad" : "happy"
      if happiness && nausea
        if nausea > happiness
            "sad"
        else
            "happy"
        end
     end
    end

    def create_standard_user
        redirect_to 'signin'
    end
end

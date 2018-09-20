class User < ActiveRecord::Base
    has_secure_password
     has_many :rides
    has_many :attractions, through: :rides
     def mood
      if self.happiness.to_i < self.nausea.to_i
        'sad'
      elsif self.happiness.to_i > self.nausea.to_i
        'happy'
      end
    end
     def is_admin?
      return "ADMIN" if self.admin
    end
end
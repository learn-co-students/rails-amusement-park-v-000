class User < ActiveRecord::Base

  has_many :rides
  has_many :attractions, through: :rides

    has_secure_password

    validates :name, presence: true


    def mood
        if self.happiness && self.nausea
          mood = self.happiness - self.nausea
          mood > 0 ? "happy" : "sad"
        end
    end

    def admin?
      self.admin
    end
end

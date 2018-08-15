class User < ActiveRecord::Base
    has_many :rides
    has_many :attractions, through: :rides
    has_secure_password
    validates :name, presence: true
    validates :name, uniqueness: true
    validates :password_digest, presence: true
    # validates :happiness, presence: true
    # validates :nausea, presence: true
    # validates :height, presence: true
    # validates :tickets, presence: true


    def mood
     if self.happiness && self.nausea
       mood = self.happiness - self.nausea
       mood > 0 ? "happy" : "sad"
     end
   end

   def num_of_rides
     self.attractions.count
   end
end

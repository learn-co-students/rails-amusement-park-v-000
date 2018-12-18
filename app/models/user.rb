class User < ActiveRecord::Base
    has_secure_password

    has_many :rides
    has_many :attractions, through: :rides

    before_create :default_values

    def mood
        if self.happiness && self.nausea
          mood = self.happiness - self.nausea
          mood > 0 ? "happy" : "sad"
        end
      end

    private

    def default_values
        self.admin ||= 'false'
    end
end

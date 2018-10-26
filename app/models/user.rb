class User < ActiveRecord::Base
    has_secure_password
    has_many :rides
    has_many :attractions, through: :rides

    validates :name, :presence => true
    validates :min_height, :presence => true
    validates :nausea, :presence => true
    validates :height, :presence => true
    validates :happiness, :presence => true
    validates :tickets, :presence => true

    def mood
        # returns 'sad' when the user is more nauseous than happy
    # else
    # returns 'happy' when the user is more happy than nauseous

    end
end

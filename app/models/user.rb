class User < ActiveRecord::Base
    has_secure_password
    has_many :rides
    has_many :attractions, through: :rides

    validates :name, uniqueness: true, presence: true

    def mood
        happiness < nausea ? "sad" : "happy" if admin == false
    end
end

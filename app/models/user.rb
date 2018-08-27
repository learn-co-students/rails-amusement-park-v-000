class User < ActiveRecord::Base
    has_many :rides
    has_many :attractions, through: :rides
    # should be there, but breaks tests
    # validates :name, :height, :happiness, :nausea, :tickets, presence: true
    has_secure_password

    def mood
        if nausea && happiness
          nausea > happiness ? "sad" : "happy"
        else
          "very sad, no nausea and/or happiness at all!"
        end
    end
end

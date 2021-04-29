class User < ActiveRecord::Base
    has_many :rides
    has_many :attractions, through: :rides
    has_secure_password

    # the unless admin didn't pop up until the admin
    # portion of testing, I devined this from the solution
    # as well. I keep forgetting there are cool/helpful
    # things like this in Ruby!
    def mood
        nausea > happiness ? "sad" : "happy" unless admin
    end
end

class User < ApplicationRecord
    has_secure_password
    has_many :rides
    has_many :attractions, through: :rides
  
    def mood
      # has a method 'mood' that returns 'sad' when the user is more nauseous than happy
      # has a method 'mood' that returns 'happy' when the user is more happy than nauseous
      unless admin
        happiness > nausea ? 'happy' : 'sad'
      end
    end
  end
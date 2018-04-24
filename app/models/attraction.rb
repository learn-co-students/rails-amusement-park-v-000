class Attraction < ApplicationRecord
    has_many :users
    has_many :rides, through: :users
    
end

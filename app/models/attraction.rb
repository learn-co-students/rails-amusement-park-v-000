class Attraction < ApplicationRecord
    has_many :rides
    has_many :users, through: :rides
    validates :tickets, :nausea_rating, :happiness_rating, :min_height, presence: true
end

class Attraction < ApplicationRecord

  validates :name, :min_height, :nausea_rating, :happiness_rating, :tickets, presence: true
end

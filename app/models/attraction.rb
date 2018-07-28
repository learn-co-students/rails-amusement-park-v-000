class Attraction < ApplicationRecord
  validates :name, :min_height, :nausea_rating, :happiness_rating, :tickets, presence: true
  has_many :rides
  has_many :users, through: :rides
end

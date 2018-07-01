class Attraction < ApplicationRecord
  #validates_presence_of :name, :min_height, :nausea_rating, :happiness_rating, :tickets
  has_many :rides
  has_many :users, through: :rides
end

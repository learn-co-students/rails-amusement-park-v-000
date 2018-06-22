class Attraction < ApplicationRecord
  #valid with name, min_height, nausea_rating, happiness_rating, ticket_number

  has_many :rides
  has_many :users, through: :rides 
end

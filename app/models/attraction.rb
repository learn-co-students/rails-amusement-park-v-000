class Attraction < ApplicationRecord
  has_many :users, through: :rides
  has_many :rides
end

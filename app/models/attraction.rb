class Attraction < ApplicationRecord
  has_many :rides
  has_many_through :users, through: :rides
end

class Attraction < ApplicationRecord
  validates :name, presence: true

  has_many :rides
  has_many :users, through: :rides
end

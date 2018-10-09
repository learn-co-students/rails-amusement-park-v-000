class Attraction < ApplicationRecord
    has_many :rides
    has_many :users
    has_many :users, through: :rides
    validates :name, presence: true
end

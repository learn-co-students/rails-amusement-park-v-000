class Attraction < ApplicationRecord
    #validates :presence, :name
    has_many :rides
    has_many :users, through: :rides
end

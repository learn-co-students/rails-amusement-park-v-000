class Attraction < ActiveRecord::Base
    has_many :users, through :rides
    has_many :rides
end

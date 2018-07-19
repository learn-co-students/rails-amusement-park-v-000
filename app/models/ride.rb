class Ride < ActiveRecord::Base
  belongs_to :attractions
  belongs_to :user
end

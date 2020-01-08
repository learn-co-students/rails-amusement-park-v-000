class Ride < ActiveRecord::Base
  belongs_to :attraction
  belongs_to :user
end

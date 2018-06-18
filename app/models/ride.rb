class Ride < ActiveRecord::Base
  validates :user_id, presence: true
  validates :attraction_id, presence: true
  belongs_to :attraction
  belongs_to :user
end

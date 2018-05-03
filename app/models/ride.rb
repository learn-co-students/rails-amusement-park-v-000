class Ride < ActiveRecord::Base
  belongs_to :user
  belongs_to :attraction

  validates :user_id, presence: true
  validates :attraction_id, presence: true
end

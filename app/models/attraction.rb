class Attraction < ApplicationRecord
  has_many :rides
  has_many :users, :through => :rides

  def user_count
    users.count
  end

end

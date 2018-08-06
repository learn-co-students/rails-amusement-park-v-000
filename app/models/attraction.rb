class Attraction < ApplicationRecord
  has_many :rides
  has_many :users, through: :rides


  def total_users
    self.users.count
  end

end

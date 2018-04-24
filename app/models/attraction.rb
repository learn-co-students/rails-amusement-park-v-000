class Attraction < ApplicationRecord
  has_many :rides
<<<<<<< HEAD
  has_many :users, through: :rides
=======
  has_many :users, :through => :rides
>>>>>>> refs/remotes/origin/master
end

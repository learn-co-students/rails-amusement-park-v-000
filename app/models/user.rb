class User < ApplicationRecord
  has_many :rides
  has_many :users, through: :rides
  has_secure_password
end

class User < ApplicationRecord
  has_many :rides
  has_many_through :attractions, through: :rides
  has_secure_password
end

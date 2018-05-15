class User < ApplicationRecord
  has_many :rides
  has_many :attractions, through: :rides
  has_secure_password
end

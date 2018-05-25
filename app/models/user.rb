class User < ApplicationRecord
  has_many :rides
  has_many :attractions, through: :rides
end

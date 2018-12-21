class User < ActiveRecord::Base
  has_many :rides
  has_many :attractions, through: :rides
end

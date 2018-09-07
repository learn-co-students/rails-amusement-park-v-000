class User < ActiveRecord::Base
  has_secure_password
  has_many :rides
  has_many :attraction, through: :rides
end

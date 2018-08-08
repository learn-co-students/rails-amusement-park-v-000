class User < ActiveRecord::Base
  has_many :attractions
  has_secure_password
end

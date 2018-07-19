class User < ActiveRecord::Base
  has_secure_password

  validates :name, :password, :nausea_rating, :happiness_rating, :min_height, :tickets, presence: true
end

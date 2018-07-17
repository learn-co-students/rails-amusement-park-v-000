class User < ActiveRecord::Base
  validates :password, presence: true
end

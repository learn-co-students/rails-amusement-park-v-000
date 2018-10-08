class User < ActiveRecord::Base
    validates :password, presence: true
    has_many :rides
    has_many :attractions
    has_many :attractions, through: :rides
end

class User < ActiveRecord::Base
    has_secure_password    
    validates :email, :presence => true, :uniqueness => true
  
    has_many :foods
    has_many :items, through: :foods
end

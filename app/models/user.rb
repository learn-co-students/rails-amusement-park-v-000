class User < ApplicationRecord
  has_secure_password
  has_many :rides
  has_many :attractions, through: :rides


  def mood

    self.nausea >= self.happiness ? 'sad' : 'happy'
  end


  def self.user_name
    self.all.map do |user|
      user.name
    end
  end



  def user_name
    self.name
  end

end

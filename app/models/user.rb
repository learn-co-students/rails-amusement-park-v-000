class User < ActiveRecord::Base
  has_secure_password
  has_many :rides
  has_many :attractions, through: :rides


  def mood
    if !admin?
      nausea.to_i > happiness.to_i ? "sad" : "happy"
    end
  end

end

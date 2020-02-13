class User < ActiveRecord::Base
  has_many :rides
  has_many :attractions, through: :rides
  has_secure_password

  def mood
    unless admin
    if nausea > happiness
    'sad'
    else
    'happy'
    end
  end
    
  end


end

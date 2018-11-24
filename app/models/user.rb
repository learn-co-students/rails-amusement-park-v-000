class User < ActiveRecord::Base
  has_secure_password
  has_many :rides
  has_many :attractions, through: :rides

  def mood
    if !admin?
      if happiness > nausea
        'happy'
      else
        'sad'
      end
    else
      'ADMIN'
    end
  end
end

class User < ActiveRecord::Base
  has_many :rides
  has_many :attractions, through: :rides
  has_secure_password

  def mood
    if nausea == nil || happiness == nil
      nil
    else
      nausea > happiness ? 'sad' : 'happy'
    end
  end

end

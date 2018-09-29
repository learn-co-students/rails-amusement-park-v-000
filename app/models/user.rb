class User < ActiveRecord::Base
  has_secure_password
  has_many :rides
  has_many :attractions, through: :rides

  def mood
    if happiness > nausea
      "happy"
    elsif happiness < nausea
      "sad"
    end
  end
end

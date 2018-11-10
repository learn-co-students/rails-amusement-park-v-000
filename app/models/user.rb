class User < ActiveRecord::Base
  has_many :rides
  has_many :attractions, :through => :rides
  has_secure_password

  def mood
    if nausea <= happiness
      "happy"
    else
      "sad"
    end
  end

  def total_rides
    attractions.count
  end
end

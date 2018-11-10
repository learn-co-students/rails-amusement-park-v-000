class User < ActiveRecord::Base
  has_many :rides
  has_many :attractions, :through => :rides
  has_secure_password

  def mood
    if happiness && nausea
      mood = happiness - nausea
      mood > 0 ? "happy" : "sad"
    end
  end

  def total_rides
    attractions.count
  end
end

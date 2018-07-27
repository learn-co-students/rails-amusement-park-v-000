class User < ActiveRecord::Base
  has_secure_password
  has_many :rides
  has_many :attractions, through: :rides

  def admin=(status)
    if !status
      @admin = false
    else
      @admin = status
    end
  end

  def admin
    @admin
  end

  def mood
    "happy" if @happiness > @nausea
    "sad"
  end
end

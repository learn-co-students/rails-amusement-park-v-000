class User < ActiveRecord::Base
  has_many :rides
  has_many :attractions, through: :rides

  validates :password, presence: true

  def admin=(boolean=false)
    @admin = boolean
  end

  def admin
    @admin
  end

  def mood
    return "happy" if @happiness > @nausea
    return "sad"
  end
end

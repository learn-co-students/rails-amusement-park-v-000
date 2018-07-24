class User < ActiveRecord::Base
  has_many :rides
  has_many :attractions, through: :rides
  has_secure_password
#  validates :name, presence: true
#  validates :password, presence: true

  def mood
    if !nausea || !happiness
      return ""
    elsif nausea >= happiness
      return "sad"
    elsif happiness > nausea
      return "happy"
    end
  end

end

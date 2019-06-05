class User < ActiveRecord::Base
  has_many :rides
  has_many :attractions, through: :rides
  validates :name, presence: true
  has_secure_password

  def mood
    if happiness > nausea
      return "happy"
    else happiness < nausea
      return "sad"
    end
  end

end

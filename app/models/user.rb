class User < ActiveRecord::Base
  validates :name, presence: true
  has_secure_password

  has_many :rides
  has_many :attractions, through: :rides

  def mood
    if nausea > happiness then "sad" else  "happy" end unless nausea == nil
  end

end

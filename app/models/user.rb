class User < ActiveRecord::Base
  has_many :rides
  has_many :attractions, through: :rides
  validates :name, presence: true
  has_secure_password

  def mood
  if happiness != nil && nausea != nil
      if happiness > nausea
        "happy"
      else happiness < nausea
        "sad"
      end
    end
  end

  def admin?
    if admin
      true
    else
      false
    end
  end

end

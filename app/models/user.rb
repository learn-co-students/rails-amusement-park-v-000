class User < ActiveRecord::Base
  has_secure_password
  has_many :rides
  has_many :attractions, through: :rides

  def mood
    if happiness && nausea
      happiness > nausea ? "happy" : "sad"
    else
      ""
    end
  end

  def is_admin?
    admin
  end
end

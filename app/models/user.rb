class User < ApplicationRecord
  has_many :rides
  has_many :attractions, through: :rides
  has_secure_password
  # after_save :toggle_admin

  def mood
    if self.happiness && self.nausea
      (self.happiness > self.nausea) ? "happy" : "sad"
    end
  end


end

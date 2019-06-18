class User < ApplicationRecord
  has_secure_password

  has_many :rides
  has_many :attractions, :through => :rides, :source => :attraction

  def mood
    if self.nausea.present? && self.happiness.present?
      (self.nausea > self.happiness) ? "sad" : "happy"
    end

  end
end

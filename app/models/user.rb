class User < ActiveRecord::Base
  has_secure_password

  has_many :rides
  has_many :attractions, through: :rides

  def mood
    if nausea.present? && happiness.present?
      if self.nausea > self.happiness
          "sad"
      elsif self.nausea < self.happiness
          "happy"
      else
          ""
      end
    end 
  end
end

class User < ActiveRecord::Base
  has_secure_password
  validates :name, :nausea, :happiness, :tickets, :height, :password, presence: true
  has_many :rides
  has_many :attractions, :through => :rides

  def mood
    if nausea.present? && happiness.present?
      if self.nausea > self.happiness
        "sad"
      else
        "happy"
      end
    end
  end

end

class User < ActiveRecord::Base
  has_secure_password
  has_many :rides
  has_many :attractions, through: :rides
  validates :name, :uniqueness => {:message => "has already been used" }
  validates :height, :numericality => { only_integer: true, allow_nil: true, message: "must be a number"}
  validates :happiness, :numericality => { only_integer: true, allow_nil: true, message: "must be a number"}
  validates :nausea, :numericality => { only_integer: true, allow_nil: true, message: "must be a number"}
  def mood
    if self.nausea && self.happiness
      self.nausea > self.happiness ? "sad" : "happy"
    end
  end
end

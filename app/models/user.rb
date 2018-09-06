class User < ActiveRecord::Base
  has_many :rides
  has_many :attractions, through: :rides
  has_secure_password

  after_initialize :set_defaults, unless: :persisted?

  def mood
    self.happiness > self.nausea ? "happy" : "sad"
  end

  private

  def set_defaults
    self.admin = false if self.admin.nil?
  end
end

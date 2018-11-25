class User < ActiveRecord::Base
  has_many :rides
  has_many :attractions, through: :rides
  has_secure_password
  validates :name, presence: true
  validates :name, uniqueness: true

  after_initialize :init

  def init
    self.admin ||= false
  end

  def mood
    if self.nausea && self.happiness
      self.nausea > self.happiness ? 'sad' : 'happy'
    else
      nil
    end
  end
end

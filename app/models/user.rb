class User < ActiveRecord::Base
  has_many :rides
  has_many :attractions, through: :rides

  has_secure_password

  before_create :set_admin_default

  validates :admin, presence: false

  def mood
    if self.happiness && self.nausea
      if self.happiness > self.nausea
        'happy'
      else
        'sad'
      end
    end
  end

  private

  def set_admin_default
    self.admin ||= 'false'
  end
end

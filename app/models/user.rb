class User < ActiveRecord::Base
  has_secure_password

  has_many :rides
  has_many :attractions, through: :rides

  validates :name, presence: true
  validates_numericality_of :height, :only_integer => true, :greater_than_or_equal_to => 0
  validates_numericality_of :happiness, :only_integer => true, :greater_than_or_equal_to => 0, :less_than_or_equal_to => 5
  validates_numericality_of :nausea, :only_integer => true, :greater_than_or_equal_to => 0, :less_than_or_equal_to => 5
  validates_numericality_of :tickets, :only_integer => true, :greater_than_or_equal_to => 0


  def mood
    if self.nausea > self.happiness
      p "sad"
    else
      p "happy"
    end
  end

end

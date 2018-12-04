class User < ActiveRecord::Base
  # include ActiveModel::Validations
  # validates :name, presence: true
  # validates :password, presence: true
  # validates :happiness, presence: true
  # validates :nausea, presence: true
  # validates :height, presence: true
  # validates :tickets, presence: true

  has_many :rides
  has_many :attractions, through: :rides

  def mood
    happiness > nausea ? "happy" : "sad"
  end

  def taller_than?
    self.height >= 40
  end

  def more_tickets_than?
    self.tickets > 1
  end

  def rating_increase
    self.happiness += 1
    self.nausea += 1
  end

  def ticket_decrease
    self.tickets -= 1
  end

end

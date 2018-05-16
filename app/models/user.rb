class User < ApplicationRecord
  has_many :rides
  has_many :attractions, through: :rides
  has_secure_password

  def ticket_count(attraction)
    self.tickets = self.tickets - attraction.tickets
    self.save
  end





end

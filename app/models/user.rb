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
end

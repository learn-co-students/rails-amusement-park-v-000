class Attraction < ApplicationRecord
  has_many :rides
  has_many :users, through: :rides
  accepts_nested_attributes_for :users
  # validates_presence_of :name, :min_height, :nausea_rating, :happiness_rating, :ticket_number
  def new
  end

  def create
  end

end

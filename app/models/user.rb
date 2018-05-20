class User < ActiveRecord::Base

  has_many :rides
  has_many :attractions, :through => :rides

  validates :password, presence: true
  def mood
    if nausea.present? && happiness.present?
      if nausea > happiness
        "sad"
      elsif happiness > nausea
        "happy"
      end
    end
  end

end

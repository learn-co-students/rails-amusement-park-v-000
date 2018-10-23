class User < ActiveRecord::Base
  has_many :rides
  has_many :attractions, through: :rides
  has_secure_password

  def mood
    if nausea.present? && happiness.present?
      if nausea > happiness
        return "sad"
      else
        return "happy"
      end
    else
      "I don't know"
    end
  end

end

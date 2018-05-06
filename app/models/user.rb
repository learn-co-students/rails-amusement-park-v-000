class User < ActiveRecord::Base
  has_secure_password
  has_many :rides
  has_many :attractions, through: :rides

  def mood_comparator
    if self.nausea > self.happiness
      return 'sad'
    elsif self.nausea < self.happiness
      return 'happy'
    end
  end

  def mood
    if self.admin=false
      mood_comparator
    else
      if self.nausea.present? && self.happiness.present?
        mood_comparator
      end
    end
  end


end

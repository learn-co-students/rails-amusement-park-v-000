class User < ActiveRecord::Base
  has_secure_password

  has_many :rides
  has_many :attractions, through: :rides

  def mood
    # #to_i is needed because some tests don't fill in nausea or happiness. It converts nil to 0.

    if self.happiness.to_i > self.nausea.to_i
      "happy"
    elsif self.happiness.to_i == self.nausea.to_i
      "apathetic" # I added this
    else
      "sad"
    end
  end
end

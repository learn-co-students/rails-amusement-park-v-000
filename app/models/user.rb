class User < ApplicationRecord

  has_secure_password

  has_many :rides
  has_many :attractions, through: :rides

  def mood
    # binding.pry
    if !nausea.blank? && !happiness.blank?
      if nausea < happiness
        "happy"
      else
        "sad"
      end
    end
  end


  # def user_login
  #   # binding.pry
  #   session[:user_id] = self.id
  # end

end

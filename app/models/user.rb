class User < ActiveRecord::Base
  has_many :rides
  has_many :attractions, through: :rides
  has_secure_password
  #validates :name, presence: true, uniqueness: true

  def mood
    if self.happiness && self.nausea
      if self.happiness < self.nausea
        return "sad"
      else
        return "happy"
      end
    else
      nil
    end
  end

  def current_user
  
    @current_user ||= User.find_by(id: session[:user_id])
  end

end

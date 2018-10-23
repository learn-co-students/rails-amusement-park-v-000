class User < ActiveRecord::Base
  has_secure_password

  has_many :rides
  has_many :attractions, :through => :rides

  

  def mood
    if !self.nausea.nil? && !self.happiness.nil?
      return "sad" if self.nausea > self.happiness
      return "happy" if self.happiness > self.nausea
      #(self.nausea > self.happiness) ? "sad" : "happy"
      #ternary operator ^^
    end
  end

  def admin_tag
    if self.admin
      return "ADMIN"
    end
  end

end
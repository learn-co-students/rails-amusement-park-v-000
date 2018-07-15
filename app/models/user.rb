class User < ActiveRecord::Base
  has_secure_password

  def mood(num)
  case num
    when 1
      @happiness = 'sad'
    when 2
      ''
    when 3
      @happiness ='happy'
    when 4
      ''
    else
      'super'
    end
  end


end

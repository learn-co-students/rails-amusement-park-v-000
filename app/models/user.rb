class User < ActiveRecord::Base

    has_secure_password
    
    def user_name
        self.name
        #binding.pry
    end 
end

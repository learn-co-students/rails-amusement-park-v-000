class UserController < ApplicationController
    
    def create 
        @user = User.create(user_params)
    end 
    
    User.create(
        :name => "Mindy",
        :password => "password",
        :nausea => 5,
        :happiness => 3,
        :tickets => 4,
        :height => 34
      )


      private 

      def user_params
        
      end 
end 
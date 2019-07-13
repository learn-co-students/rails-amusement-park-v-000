class SessionsController < ApplicationController

    def new
        @users = User.all
      end
  
      def create
     
          if user = User.find_by(id: params[:user][:id])
  
          #if user.try(:authenticate, params[:user][:password])
      
          session[:user_id] = user.id
      
          @user = user
          
          redirect_to user_path(@user)
          #redirect_to controller: 'users', action: 'show'
          
        else
            redirect_to controller: 'static_pages', action: 'home'
          #redirect_to(controller: 'sessions', action: 'new')
      end
    end
    
    def destroy
        session.delete :user_id
        redirect_to '/'
      end

end

class SessionsController < ApplicationController
   
    def new
    end
    
    def create
        if @user=User.find_by(name: session_params[:user_name])
            if @user.authenticate(session_params[:password])
                session[:user_id]=@user.id
                redirect_to user_path(@user)
            else
                flash[:message]="Incorrect password for user"
                redirect_to signin_path
            end
        else
            flash[:message]="Username not found"
            redirect_to signin_path

        end
    end
    
    def destroy
        session.delete :user_id
        redirect_to root_path
    end
    
    private
    
    def session_params
        params.permit(:user_name, :password)
    end
    
end
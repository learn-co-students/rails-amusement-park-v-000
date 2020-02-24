class SessionsController < ApplicationController

    def new
        @user = User.new
    end


    def create
     # raise params.inspect
      @user = User.find_by(name: params[:user][:name])
      if @user
        session[:user_id] = @user.id
        redirect_to user_path(@user)
      else
        render 'sign_in'
      end
    end

    def destroy
       # binding.pry
        # reset_session
       # binding.pry
        session.delete(:user_id)
        redirect_to '/'
    end

    private
    def session_params
        params.require(:session).permit(:user, :password)
    end

end

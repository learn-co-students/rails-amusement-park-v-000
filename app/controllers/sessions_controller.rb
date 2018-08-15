class SessionsController < ApplicationController
    def new
      @users = User.all
    end

    def create
    @user = User.find_by(name: params[:user][:name])
        # @user = User.find(params[:id])

        if @user && @user.authenticate(params[:password])
            session[:user_id] = @user.id
            redirect_to @user
            flash[:notice] = "Successful login"
        else
          raise params.inspect
            flash[:notice] = "Invalid login"
            redirect_to root_path
        end
    end

    def destroy
        session.destroy
        redirect_to root_url
    end
end

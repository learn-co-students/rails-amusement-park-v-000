class SessionsController < ApplicationController

    def new
      @user = User.new(id: nil)
    end

    def create

      user = User.find_by(name: user_params[:name])

      user = user.try(:authenticate, user_params[:password])

      return redirect_to root_path unless user

      session[:user_id] = user.id

      @user = user

      redirect_to user_path(@user)
    end

    def destroy
      session.delete :user_id

      redirect_to '/'
    end

    private

    def user_params
      params.require(:user).permit(:name,:height,:happiness,:nausea,:tickets, :password)
    end


end

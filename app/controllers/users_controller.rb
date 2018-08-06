class UsersController < ApplicationController

    def new
         @user = User.new
    end


    def create
          @user = User.new(strong_params(params))
          if helpers.logged_in?
              redirect_to root_path
          else
              if @user.save
                  binding.pry
                  params[:user][:admin].exsists? ?
                  session[:user_id] = @user.id : false
                  redirect_to user_path(@user)
              else
                  redirect_to '/sessions/new'
              end
          end
    end

    def show
        @user = User.find_by(:id => params[:id])
        if helpers.current_user == @user
            render :show
        else
            redirect_to root_path
        end
    end

    private

    def strong_params(params)
        params.require(:user).permit(:name, :height, :happiness, :nausea, :tickets, :password)
    end

end

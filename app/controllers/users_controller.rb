class UsersController < ApplicationController
    
    def new
        if !current_user
            @user = User.new
        else
            flash[:notice] = "You're already logged in!"
            redirect_to user_path(current_user)
        end
    end
    
    def create
        if !params[:user][:admin] && params[:user].values.include?("")
            flash[:notice] = "All fields are required."
            redirect_to new_user_path
        elsif params[:user][:admin] && (params[:user][:name] == "" || params[:user][:password] == "")
            flash[:notice] = "You must enter a name and password."
            redirect_to new_user_path
        else
            @user = User.new(user_params)
            if @user.save
                session[:user_id] = @user.id
                redirect_to user_path(@user)
            else
                redirect_to new_user_path
            end
        end
    end
    
    def show
        if current_user
            @user = User.find_by(id: params[:id])
            if @user != current_user
                flash[:notice] = "You cannot access other users' information."
                redirect_to user_path(current_user)
            end
        else
            flash[:notice] = "You must be logged in to view your account details."
            redirect_to '/'
        end
    end
    
    def buy_tickets
        if current_user
            @user = User.find_by(id: params[:id])
            if @user != current_user
                flash[:notice] = "You can only purchase tickets for yourself."
                redirect_to user_path(current_user)
            end
        else
            flash[:notice] = "You must be logged in purchase tickets."
            redirect_to '/'
        end
    end
    
    def update_tickets
        @user = User.find_by(id: params[:id])
        if params[:new_tickets].to_i > 0 && params[:new_tickets].to_i <= 5000
            @user.tickets += params[:new_tickets].to_i
            @user.save
            redirect_to user_path(@user)
        else
            flash[:notice] = "You can buy between 1 and 5000 tickets at one time. Please select a different value!"
            redirect_to "/users/#{@user.id}/tickets"
        end
    end
    
    private
    
    def user_params
        params.require(:user).permit(:name, :password, :height, :nausea, :happiness, :tickets, :admin)
    end

end
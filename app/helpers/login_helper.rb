module LoginHelper 
    def user_signup
        @user = User.new(params[:user_params])
    end 
 
    def user_login #aka def create
        if @user = User.authenticate(params[:name], params[:password])
          session[:user_id] = @user.id
          redirect_to root_url
        end
    end 

    def admin_signup
        # if you have admin privileges/check against admin list? 
        if admin? 
           user
        end 
    end 

    def admin_login
        @user.id if admin? == true
        user_admin
    end 


    def create_standard_user 
        @user = User.new(:user_params)
        # @user = User.new(params[:user_params])
    end 


    def create_standard_and_admin_user
    end 

    def current_user
        @current_user ||= User.find_by(id: session[:user_id])
    end 

    def logged_in?
        !!current_user
    end
    
    private
    def user_params
        params.require(:user).permit(:name, :password, :happiness, :nausea, :height, :tickets, :admin) 
    end 
end

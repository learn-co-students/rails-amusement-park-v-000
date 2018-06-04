class SessionsController <  Devise::SessionsController 
    # def new 
    #     @user = User.new 
    # end
    skip_before_filter :verify_signed_out_user, :only => [:destroy]
    def create 
        # allowed = user_params
       
        @user = User.find_by(name: params[:user][:name])
        if @user && @user.valid_password?(params[:user][:password])
            sign_in(:user, @user)
            session[:user_id] = @user.id 
            redirect_to user_path(@user)
        else 
            flash.now.alert = "Invalid email or password"
            render 'new'
        end
    end

    def destroy
        session.delete(:user_id)
        super
    end
end
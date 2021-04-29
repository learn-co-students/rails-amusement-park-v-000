class SessionsController < ApplicationController
    # this was devined from the solution, a hook that
    # wasn't covered in a lesson/lab but makes sense!
    # ensure this is set correctly to avoid an inifite loop
    # although Rails helpfully tells you you have done this :D
    skip_before_action :authenticated_user, only: [:new, :create]

    def new

    end

    def create
        user = User.find_by(name: params[:user][:name])
        if user && user.authenticate(params[:password])
            session[:user_id] = user.id
            redirect_to user_path(user)
        else
            redirect_to signin_path
        end
    end

    def destroy
        # I got this method from an Avi video, it's
        # pretty awesome
        reset_session
        redirect_to root_path
    end

end
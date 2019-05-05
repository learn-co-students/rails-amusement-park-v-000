class SessionsController < ApplicationController
# binding.pry
# before_action :require_login
# binding.pry

  def new
    # binding.pry
    @user = User.new
  end

# binding.pry

  def create
    # binding.pry

    # i need to authenticate them by password, to make sure that
    # it's the real user. if the password is right, then I can
    # log them in.
    # binding.pry
    # binding.pry
    if @user = User.find(params[:user][:name])
      # binding.pry

    # the first of these 'if' lines was having problems. i think
    # it's related to the password digest thing. it just has nil
    # as password. the if statement fails, so it always gets sent to the first
    # redirect '/'
    # unless the lack of a uniqueness validation is causing these problems somehow?
    #
      # if (@user.password_digest == params[:password_digest])
      # binding.pry

      if @user.authenticate(params[:password])
        # binding.pry
         session[:user_id] = @user.id
         redirect_to user_path(@user)
      else
         redirect_to '/'
      end
    else
        redirect_to '/'
    end
# binding.pry
 end


  def destroy
    session[:user_id].delete
    redirect_to '/'
  end





end

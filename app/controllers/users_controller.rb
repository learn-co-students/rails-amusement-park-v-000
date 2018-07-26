class UsersController < ApplicationController

  def index
  end

  def new
    @user = User.new
  end

  def create
# binding.pry
    if !user_params.empty?
      @user = User.new(user_params)

      if @user.save
        session[:user_id] = @user.id
        flash[:notice] = "User account created successfully"
        # redirect_to @user
        redirect_to user_path(@user)
        # redirect_to '/show'
        # redirect_to controller: 'users', action: 'show'
      else
        flash[:alert] = "User account not saved successfully"
        render :new
      # redirect_to controller: 'users', action: 'new'
      end
    else
      flash[:alert] = "Error, fill in all form fields before submitting"
      render :new
    end
  end

  def show
    @user = User.find_by(session[:user_id])
  end

  private

  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation, :nausea, :happiness, :tickets, :height, :admin)
  end
end

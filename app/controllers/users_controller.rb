class UsersController < ApplicationController
<<<<<<< HEAD
  before_action :authenticatation_required, only: [:show]

=======
  skip_before_action :verify_user_is_authenticated, only: [:new,:create]
>>>>>>> refs/remotes/origin/master
  def new
    @user = User.new
  end

  def create
<<<<<<< HEAD
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      render :new
=======
    if (user = User.create user_params)
      session[:user_id] = user.id
      redirect_to user_path(user)
    else
      render 'new'
>>>>>>> refs/remotes/origin/master
    end
  end

  def show
<<<<<<< HEAD
    @user = User.find(params[:id])
=======
    @user = User.find_by(id:params[:id])
>>>>>>> refs/remotes/origin/master
  end

  private
  def user_params
<<<<<<< HEAD
    params.require(:user).permit(:name, :password, :height, :tickets, :nausea, :happiness, :admin)
  end

end
=======
    params.require(:user).permit(
      :name,
      :height,
      :height,
      :nausea,
      :tickets,
      :admin,
      :admin,
      :password,
      :happiness
      )
  end
end
>>>>>>> refs/remotes/origin/master

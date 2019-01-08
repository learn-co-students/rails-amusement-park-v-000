class UsersController <ApplicationController
  before_action :authenticate_user, only: [:show]

  def new
    @user = User.new
  end

  def create
      @user = User.create(user_params)
      if @user.save
        session[:user_id] = @user.id
        redirect_to user_path(@user)
      else
        render 'new'
      end
  end

  def show
    @user = User.find_by(id: params[:id])
      if @user.id != current_user.id
        redirect_to users_path(current_user.id)
      end
      if params[:message]
      @message = params[:message]
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :password, :height, :happiness, :nausea, :tickets, :admin)
  end



end

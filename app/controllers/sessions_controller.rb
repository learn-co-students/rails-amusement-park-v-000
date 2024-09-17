class SessionsController < ApplicationController  
    def new
     @user = User.new
     @users = User.all
    end

    #Austin Melchior said you don't need a fancy layout for admin.
    

    def create
      @user = User.find_by(:name => params[:user][:name])
      #byebug  
      #@user = User.find_by(:id => params[:user][:name])  
      return head(:forbidden) unless @user.authenticate(params[:password])
      #password is seperate from user due to form wanting password and not user_password
      if @user
      session[:user_id] = @user.id
      redirect_to user_path(@user)
      end
    end

=begin    
<%= form_for :user, url: '/signin' do |f| %>
 Your name: <%= f.collection_select :name, User.order(:name),:id,:name, include_blank: true %>
 Your password <input type="password" name="password" id="password">
 <%= f.submit "Sign In" %>
<%end%>

collection_select(object, method, collection, value_method, text_method, options = {}, html_options = {})
collection_select(object, method, collection, whats being sent in, what was labeled, options = {}, html_options = {})
object not needed 

changed to 

<%= form_for :user, url: '/signin' do |f| %>
 Your name: <%= f.collection_select :name, User.order(:name),:name,:name, include_blank: true %>
 Your password <input type="password" name="password" id="password">
 <%= f.submit "Sign In" %>
<%end%>
=end

    def destroy
        session.delete(:user_id) #delete is method used on a hash, that you give the key to
        redirect_to root_path
    end

    private 

    def user_params
        #remember to put everything in permit
        params.require(:user).permit(:name, :password)
    end
end
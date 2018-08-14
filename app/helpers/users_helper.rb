module UsersHelper

    def user_select
          select_tag "user_name", options_from_collection_for_select(User.all, :name, :name)
      end 

      def user_admin?
        if session[:user_id]
            @user = User.find_by_id(session[:user_id])
            @user.admin
        end 
      end 
end

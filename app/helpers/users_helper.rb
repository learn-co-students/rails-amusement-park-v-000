module UsersHelper
  def user_select
    select_tag "user_name", options_from_collection_for_select(User.all, :name, :name)
  end
end

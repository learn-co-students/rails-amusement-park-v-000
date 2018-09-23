module AttractionsHelper
  def admin?
    !!current_user.admin
  end
end

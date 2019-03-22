module AttractionsHelper
  def admin?
    current_user.admin == true
  end
end

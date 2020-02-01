module AttractionsHelper
  def view_attraction(att)
    current_user.admin ? "Show #{att.name}" : "Go on #{att.name}"
  end
end

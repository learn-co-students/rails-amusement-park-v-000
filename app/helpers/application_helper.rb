module ApplicationHelper

  def log_out_link
    if logged_in?
      <<-HTML
        <a class="navbar-brand" href="<%= logout_url %>"/>Log Out</a>
      HTML
    else
      <<-HTML
      HTML
    end
  end

end

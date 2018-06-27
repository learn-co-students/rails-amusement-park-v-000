module AttractionsHelper

  def attraction_show_li(object, method)
    content_label = method.to_s.split("_").join(" ")
    if attribute = object.send("#{method}")
      content_tag(:li, "#{content_label.capitalize}: #{attribute}")
    end
  end

  def attraction_index_link(user, object)
    if user.admin
      link_to "Show #{object.name}", attraction_url(object)
    else
      link_to "Go on #{object.name}", attraction_url(object)
    end
  end
end

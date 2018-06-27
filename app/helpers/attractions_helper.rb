module AttractionsHelper

  def attraction_show_li(object, method)
    content_label = method.to_s.split("_").join(" ")
    if attribute = object.send("#{method}")
      content_tag(:li, "#{content_label.capitalize}: #{attribute}")
    end
  end
end

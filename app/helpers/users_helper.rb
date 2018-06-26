module UsersHelper

  def user_info_li(object, method)
    if attribute = object.send("#{method}")
      content_tag(:li, "#{method.capitalize}: #{attribute}")
    end
  end
end

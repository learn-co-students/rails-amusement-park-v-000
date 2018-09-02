module UsersHelper

  def user_form(user)
    form_for user  do |f|
      f.label :name
      f.text_field :name

      f.label :nausea
      f.number_field :nausea

      f.label :happiness
      f.number_field :happiness

      f.label :height
      f.number_field :height

      f.label :tickets
      f.number_field :tickets

      f.label :admin
      f.check_box_field :admin

      f.label :password
      f.password_field :password

      f.label :password_confirmation
      f.password_field :password_confirmation

      f.submit "Create"
    end
  end

end

module ApplicationHelper

    def navbar_buttons
        if (user = current_user)
            render 'layouts/logged_in_buttons', user: user
        else
            render 'layouts/logged_out_buttons'
        end
    end
end

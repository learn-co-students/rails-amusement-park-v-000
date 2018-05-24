module ApplicationHelper
    def show_obj_info(obj)
        a = []
        obj.attributes.each do |k, v|
            if !['id', 'admin', 'password'].include?(k)
                a << "#{k.capitalize}: #{v}"
            end
        end
        a
    end
    
    def current_user
        current_user ||= User.find_by(id: session[:user_id])
    end
end


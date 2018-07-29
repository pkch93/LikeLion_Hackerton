module ApplicationHelper

    def current_user
        @current_user ||= Lecturer.find_by(lec_id: session[:id])
    end
    
    def user_signed_in?
        !current_user.nil?
    end
end

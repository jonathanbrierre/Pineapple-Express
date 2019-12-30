class ApplicationController < ActionController::Base
    before_action :authorized, :current_user
    helper_method :current_user, :logged_in

    def current_user
        User.find_by(id: session[:user_id])
    end

    def login_user(user)
        session[:user_id] = user.id
    end

    def logged_in? 
        !!current_user
    end

    def authorized
        unless logged_in?
            flash[:error] = "🍍We need to log in or sign up 😜🍍 "
            redirect_to "/home"
        end 
    end

end

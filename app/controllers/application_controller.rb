class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception

    helper_method [:current_user, :logged_in?]
  
  
    private 

        def login(user)
            session[:username] = user.username
            session[:user_id] = user.id
        end

        def current_user
            @current_user ||= User.find(session[:user_id]) if session[:user_id]
        end

        def logged_in?
            !current_user.nil?
        end

        def auth
            redirect_to signin_path, alert: 'You must login to access that page' unless logged_in?
        end
    
end

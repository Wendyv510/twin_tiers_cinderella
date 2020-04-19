class ApplicationController < ActionController::Base
    protect_from_forgery with: :null_session 

    helper_method :current_user 
    helper_method :logged_in?
    helper_method :authentication_required 


    def authentication_required 
        if !logged_in? 
            redirect_to login_path 
        end 
    end 

    def logged_in?
        !!current_user 
    end 

    def current_user 
       @current_user || User.find_by(id:session[:user_id]) if session[:user_id]
    end 


end

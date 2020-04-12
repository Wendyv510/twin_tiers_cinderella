class SessionsController < ApplicationController

    def new  
    end 

    def create 
        if auth = request.env["omniauth.auth"]
           @user = User.find_or_create_by_omniauth(auth) 
           session[:user_id] = @user.id 
           redirect_to root_path 
        else
           @user = User.find_by(name:params[:name])
              if @user && @user.authenticate(params[:password])  
              session[:user_id] = @user.id 
            redirect_to 'users/login'  
        else 
            render 'users/new' 
        end 
    end 

    def destroy 
        session.delete("user_id") 
        redirect_to root_path 
    end 

end

class SessionsController < ApplicationController

    def new 
        @user = User.new
        render 'users/login'    
    end 

    def create 
        if auth = request.env["omniauth.auth"]
           @user = User.find_or_create_by_omniauth(auth) 
           session[:user_id] = @user.id 
           render 'users/show'  
        else
           @user = User.find_by(name:params[:name])
              if @user && @user.authenticate(params[:password])  
              session[:user_id] = @user.id 
            render 'users/show'  
        end 
        end 
    end 

    def destroy 
        session.delete("user_id") 
        redirect_to root_path 
    end 

end

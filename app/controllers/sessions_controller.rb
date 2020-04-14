class SessionsController < ApplicationController

    def home 
    end 

    def new 
        @user = User.new
        render 'users/login'    
    end 

    def create 
        if auth = request.env["omniauth.auth"]
           @user = User.find_or_create_by_omniauth(auth) 
           session[:user_id] = @user.id 
             redirect_to users_path(@user)   
        else
           @user = User.find_by(name:params[:user][:name])
              if @user && @user.authenticate(params[:user][:password])  
              session[:user_id] = @user.id 
                redirect_to users_path(@user) 
              else 
                redirect_to 'login'   
        end 
        end 
    end 

    def destroy 
        session.delete("user_id") 
        redirect_to root_path 
    end 

end

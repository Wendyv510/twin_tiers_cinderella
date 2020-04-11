class SessionsController < ApplicationController

    def new 
        @user = User.new
        
        render 'users/new' 
    end 

    def create 
        if @user = User.find_by(name:params[:user][:name])
            return head(:forbidden) unless @user.authenticate(params[:password]) 
            @user.save 
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

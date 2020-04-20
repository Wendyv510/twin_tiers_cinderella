class SessionsController < ApplicationController

    def home 
    end 

    def new 
        @user = User.new
        render :login    
    end 

    def create 
        @user = User.find_by(email: params[:email])
          if @user && @user.authenticate(params[:password])  
            session[:user_id] = @user.id 
            redirect_to users_path(@user) 
          else 
            redirect_to login_path       
          end 
    end 

    def fbcreate  
        @user = User.find_or_create_by(uid:auth['uid']) do |u|
            
            u.email = auth['info']['email']
            u.password = SecureRandom.hex
        end 
        binding.pry
            session[:user_id] = @user.id
            redirect_to users_path(@user)  
    end 

    def ghcreate 
        @user = User.find_or_create_by(uid:auth['uid']) do |u|
            
            u.email = auth['info']['email']
            u.password = SecureRandom.hex
            session[:user_id] = @user.id
            redirect_to users_path(@user)
        end 
    end 

    def destroy 
        session.delete("user_id") 
        redirect_to root_path 
    end 

    private
 
    def auth
       request.env['omniauth.auth']
    end

end

class SessionsController < ApplicationController

    def home 
    end 

    def login 
        render :layout => 'login' 
    end 

    def new 
        @user = User.new
        render :login    
    end 

    def create 
        @user = User.find_by(name:params[:user][:name])
          if @user && @user.authenticate(params[:user][:password])  
            session[:user_id] = @user.id 
            redirect_to users_path(@user) 
          else 
            redirect_to '/login'    
          end 
    end 

    def fbcreate 
        @user = User.find_or_create_by(uid: auth['uid']) do |u|
            u.name = auth['info']['name']
            u.email = auth['info']['email']
            u.password = auth['uid']
          end
       
          session[:user_id] = @user.id
       
          redirect_to '/login'
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

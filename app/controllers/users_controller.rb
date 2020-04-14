class UsersController < ApplicationController
    

    def index 
        @users = User.all 
    end 

    def new 
        @user = User.new
        @user.teams.build 
        @user.teams.build  
    end 

    def create 
        @user = User.create(user_params) 
        @user.save 
           redirect_to '/login' 
    end 


       private 

    def user_params 
        params.require(:user).permit(:name, :email, :password) 
    end 
end

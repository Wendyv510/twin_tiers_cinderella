class UsersController < ApplicationController

    def home 
    end 
    

    def index 
        @users = User.all 
    end 

    def new 
        @user = User.new 
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

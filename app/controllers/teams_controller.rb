class TeamsController < ApplicationController

    def index 
        if params[:location]    
            @teams = Team.by_town(params[:location])  
        else 
           @teams = Team.all 
        end  
    end 

    def new 
      if params[:user_id] && @user = User.find_by_id(params[:user_id])
        @team = @user.teams.build 
      else 
        @team = Team.new
      end    
    end 

    def create 
        @team = current_user.teams.build(team_params)
        if @team.save 
           redirect_to teams_path(@team)
        else 
            render :new 
        end   
    end 

    def show 
        @team = Team.find(params[:id]) 
    end 

    def edit 
        @team = Team.find(params[:id]) 
    end 

    def update  
        @team = Team.find(params[:id]) 
        @team.update(town: params[:town], coach: params[:coach], color: params[:color], age_group: params[:age_group]) 
           redirect_to team_path(@team)  
    end 

    def destroy 
        @team = Team.find(params[:id]) 
        @team.delete 
           redirect_to teams_path 
    end 


       private 

    def team_params 
        params.require(:team).permit(:town, :coach, :color, :age_group, :user_id) 
    end 


end

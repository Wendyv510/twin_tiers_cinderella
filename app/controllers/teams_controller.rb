class TeamsController < ApplicationController

    def index 
        @teams = Team.all 
    end 

    def new 
        @team = Team.new 
           12_times do 
        @team.player.build 
    end 

    def create 
        @team = Team.create(team_params)
           redirect_to teams_path(@team)  
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

    def delete 
        @team = Team.find(params[:id]) 
        @team.delete 
           redirect_to root_path 
    end 


       private 

    def team_params 
        params.require(:team).permit(:town, :coach, :color, :age_group) 
    end 
end

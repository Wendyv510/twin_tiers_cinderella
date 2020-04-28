class PlayerTeamsController < ApplicationController

    def index 
        @player_teams = Player_team.all 
    end 

    def new 
     if params[:team_id] && @team = Team.find_by_id(params[:team_id])
        @player_team = @team.player_teams.build 
     else 
        @player_team = Player_team.new 
     end 

     def create 
        @player_team = @player.player_teams.build
     end 

     def show 
        @player_team = Player_team.find(params[:id]) 
    end 

    def edit 
        @player_team = Player_team.find(params[:id]) 
    end 

    def update  
         @player_team = Player_team.find(params[:id]) 
         @player_team.update(params.require(:player).permit(:position, :year, :team_id, :player_id)) 
         @player.save
            redirect_to player_team_path(@player_team)  
    end 

    def destroy 
        @player_team = Player_team.find(params[:id]) 
        @player_team.delete 
           redirect_to player_team_path 
    end 

    private 

    def player_team_params
        params.require(:player_teams).permit(:position, :year, :team_id, :player_id)
    end  

end

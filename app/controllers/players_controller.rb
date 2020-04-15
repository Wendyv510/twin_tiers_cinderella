class PlayersController < ApplicationController

    def index 
        if params[:team_id] && @team = Team.find_by(params[:team_id]) 
            @players = @team.players
        else   
            @players = Player.all 
        end  
    end 

    def new 
        if params[:team_id] && @team = Team.find_by(params[:team_id]) 
            @player = @team.players.build
        else   
            @player = Player.new 
        end 
    end 

    def create
        @player = current_user.players.build(player_params)   
        
         if @player.save!  
          redirect_to players_path(@player) 
         else 
            render :new 
         end  
    end 

    def show 
        @player = Player.find(params[:id]) 
    end 

    def edit 
        @player = Player.find(params[:id]) 
    end 

    def update 
        @player = Player.find(params[:id]) 
        @player.update(name: params[:name], age: params[:age], user_id: params[:user_id], team_id: params[:team_id]) 
           redirect_to player_path(@player) 
    end 

      private 

    def player_params 
        params.require(:player).permit(:name, :age, :team_id)
    end 
end

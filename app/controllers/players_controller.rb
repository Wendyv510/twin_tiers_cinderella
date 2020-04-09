class PlayersController < ApplicationController

    def index 
        @players = Player.all 
    end 

    def new 
        @player = Player.new 
    end 

    def create 
        @player = Player.create(player_params)
          redirect_to player_path(@player)  
    end 

    def show 
        @player = Player.find(params[:id]) 
    end 

    def edit 
        @player = Player.find(params[:id]) 
    end 

    def update 
        @player = Player.find(params[:id]) 
        @player.update(name: params[:name], age: params[:age], coach_id: params[:coach_id], team_id: params[:team_id]) 
           redirect_to player_path(@player) 
    end 

      private 

    def player_params 
        params.require(:player).permit(:name, :age, :coach_id, :team_id)
    end 
end

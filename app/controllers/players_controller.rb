class PlayersController < ApplicationController

    def index 
        @players = Player.all 
    end 

    def new 
        @player = Player.new(team_id: params[:team_id]) 
    end 

    def create 
        @player = current_user.player.build(player_params)
         if @player.save 
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
        @player.update(name: params[:name], age: params[:age], coach_id: params[:coach_id], team_id: params[:team_id]) 
           redirect_to players_path(@player) 
    end 

      private 

    def player_params 
        params.require(:player).permit(:name, :age, :coach_id, :team_id)
    end 
end

class PlayersController < ApplicationController

    def index 
            @players = Player.all   
    end 

    def new 
        if params[:team_id] && @team = Team.find_by(params[:team_id])  
            @player = @team.players.build 
            @player.save 
        else   
            @player = Player.new 
        end 
    end 

    def create
        @player = current_user.players.build(player_params)   
        
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
         @player.update(params.require(:player).permit(:name, :age)) 
         @player.save
            redirect_to player_path(@player)  
    end 

    def destroy 
        @player = Player.find(params[:id]) 
        @player.delete 
           redirect_to players_path 
    end 


      private 

    def player_params 
        params.require(:player).permit(:name, :age, :team_id, :user_id)
    end 
end

class PlayersController < ApplicationController
    

    def index 
            @players = Player.all   
    end 

    def new 
            @player = Player.new  
    end 

    def create
        @player = Player.create(player_params)   
        
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
         @player.update(params.require(:player).permit(:name, :date_of_birth)) 
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
        params.require(:player).permit(:name, :date_of_birth)
    end 
end

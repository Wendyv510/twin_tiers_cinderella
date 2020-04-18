after :teams do 
    @team = Team_find_by(@team.id) 
    Team.players.create(
        name: Shelly Mills, 
        age: 8,
        user_id: @user.id,
        team_id: @team.id
     ) 
     
     Team.players.create(
        name: Hillary Sip, 
        age: 8,
        user_id: @user.id,
        team_id: @team.id 
     )    

     
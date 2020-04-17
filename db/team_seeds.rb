after :users do 
    @user = User.find_by_name('Carol Fink')
    User.teams.create(
       town: Corning, 
       coach: User.name, 
       color: blue, 
       age_group: 8, 
       user_id: @user.id 
    ) 

    User.teams.create(
       town: Corning, 
       coach: User.name, 
       color: orange, 
       age_group: 12, 
       user_id: @user.id 
    ) 

    @user = User.find_by_name('Randy Stevens')
    User.teams.create(
       town: Bath, 
       coach: User.name, 
       color: yellow, 
       age_group: 8, 
       user_id: @user.id 
    ) 

    User.teams.create(
       town: Bath, 
       coach: User.name, 
       color: pink, 
       age_group: 12, 
       user_id: @user.id 
    ) 

    @user = User.find_by_name('Simon Wills')
    User.teams.create(
       town: Elkland, 
       coach: User.name, 
       color: orange, 
       age_group: 8, 
       user_id: @user.id 
    ) 

    User.teams.create(
       town: Elkland, 
       coach: User.name, 
       color: purple, 
       age_group: 12, 
       user_id: @user.id 
    ) 
    


    
end 
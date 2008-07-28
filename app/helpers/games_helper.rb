module GamesHelper
  def filtered_games_path (p)
    temp = params.dup
    
    p.each do |key, value|
      temp[key] = value
    end
    
    games_path(temp)
  end
  
  def blurb (game)
     return game.description.slice(0..600)
  end
  
  def players (game)
    @min = Player.find(game.min_players).name
    @max = Player.find(game.max_players).name 
    
    return @min if (game.min_players == game.max_players)
    return @min + "-" + @max         
  end
                                                
  def player_options()
    Player.find(:all).collect {|p| [p.name, p.id]}
  end
  
end

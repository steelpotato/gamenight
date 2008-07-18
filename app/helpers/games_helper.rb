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
    
    if (game.min_players == game.max_players)
      return @min
    end
      
    return @min + "-" + @max
  end
  
end

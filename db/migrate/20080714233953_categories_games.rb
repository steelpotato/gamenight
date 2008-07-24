class CategoriesGames < ActiveRecord::Migration
  def self.up
    create_table :categories_games, :id => false do |t|
      t.integer :game_id, :null => false
      t.integer :category_id, :null => false
      t.timestamps
    end

    # Wait for the chapter on migrations and active record
    # Multiple sets of these die for some reason
    
    chess = Game.find(1)
    chess.categories << Category.find(1)
    chess.save
    
    sol = Game.find(2)
    sol.categories << Category.find(1)
    sol.save
    
    uno = Game.find(3)
    uno.categories << Category.find(1) << Category.find(2)
    uno.save
    
    frisbee = Game.find(4)
    frisbee.categories << Category.find(3)
    frisbee.save
    
  end

  def self.down
    drop_table :categories_games
  end
end

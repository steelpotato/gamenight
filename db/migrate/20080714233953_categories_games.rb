class CategoriesGames < ActiveRecord::Migration
  def self.up
    create_table :categories_games, :id => false do |t|
      t.integer :game_id, :null => false
      t.integer :category_id, :null => false
      t.timestamps
    end
  end

  def self.down
    drop_table :categories_games
  end
end

class CreateGames < ActiveRecord::Migration
  def self.up
    create_table :games do |t|
      t.string :title, :limit => 50
      t.text :description
      t.integer :min_players
      t.integer :max_players
      t.timestamps
    end
    
    Game.create :title => 'Chess',      :min_players => 2, :max_players => 2, :description => "Chess is really old" 
    Game.create :title => 'Solitaire',  :min_players => 1, :max_players => 1, :description => "Solitaire is boring"
    Game.create :title => 'Uno',        :min_players => 2, :max_players => 10, :description => "Uno is fun"
    Game.create :title => 'Frisbee',    :min_players => 6, :max_players => 10, :description => "Frisbee is the best game ever"
  end

  def self.down
    drop_table :games
  end
end

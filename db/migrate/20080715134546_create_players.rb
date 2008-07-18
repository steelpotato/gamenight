class CreatePlayers < ActiveRecord::Migration
  def self.up
    create_table :players do |t|
      t.string :name
      t.timestamps
    end
    
    Player.create :name => 1
    Player.create :name => 2
    Player.create :name => 3
    Player.create :name => 4
    Player.create :name => 5
    Player.create :name => 6
    Player.create :name => 7
    Player.create :name => 8
    Player.create :name => 9
    Player.create :name => "Group"
    
  end

  def self.down
    drop_table :players
  end
end

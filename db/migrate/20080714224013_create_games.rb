class CreateGames < ActiveRecord::Migration
  def self.up
    create_table :games do |t|
      t.string :title, :limit => 50
      t.text :description
      t.integer :min_players
      t.integer :max_players
      t.timestamps
    end
  end

  def self.down
    drop_table :games
  end
end

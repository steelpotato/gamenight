class CreateGameVersions < ActiveRecord::Migration
  def self.up
    create_table :game_versions do |t|
      t.integer :game_id
      t.integer :user_id
      t.text :data
      t.timestamps
    end
  end

  def self.down
    drop_table :game_versions
  end
end

class CreateGames < ActiveRecord::Migration
  def self.up
    create_table :games do |t|
      t.string :title, :limit => 50
      t.string :short_title
      t.text :description
      t.timestamps
    end
  end

  def self.down
    drop_table :games
  end
end

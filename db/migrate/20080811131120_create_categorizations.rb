class CreateCategorizations < ActiveRecord::Migration
  def self.up
    create_table :categorizations do |t|
      t.integer :game_id, :null => false
      t.integer :category_id, :null => false
      t.timestamps
    end
  end

  def self.down
    drop_table :categorizations
  end
end

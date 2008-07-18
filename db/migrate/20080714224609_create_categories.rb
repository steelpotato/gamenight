class CreateCategories < ActiveRecord::Migration
  def self.up
    create_table :categories do |t|
      t.string :name
      t.timestamps
    end
    
    Category.create :name => 'Table'
    Category.create :name => 'Party'
    Category.create :name => 'Active'
  end

  def self.down
    drop_table :categories
  end
end

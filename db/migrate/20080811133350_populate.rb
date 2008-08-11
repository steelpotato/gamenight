class Populate < ActiveRecord::Migration
  def self.up
    Player.create :id => 1, :name => 1
    Player.create :id => 2, :name => 2
    Player.create :id => 3, :name => 3
    Player.create :id => 4, :name => 4
    Player.create :id => 5, :name => 5
    Player.create :id => 6, :name => 6
    Player.create :id => 7, :name => 7
    Player.create :id => 8, :name => 8
    Player.create :id => 9, :name => 9
    Player.create :id => 10, :name => "Group"
    
    table = Category.create :name => 'Table'
    party = Category.create :name => 'Party'
    active = Category.create :name => 'Active'
    
    Game.create :title => 'Chess',      :min_players => 2, :max_players => 2, :description => "Chess is really old", :categories => [table] 
    Game.create :title => 'Solitaire',  :min_players => 1, :max_players => 1, :description => "Solitaire is boring", :categories => [table]
    Game.create :title => 'Uno',        :min_players => 2, :max_players => 10, :description => "Uno is fun", :categories => [table, party]
    Game.create :title => 'Frisbee',    :min_players => 6, :max_players => 10, :description => "Frisbee is the best game ever", :categories => [active]
  end

  def self.down
    Player.destroy_all
    Game.destroy_all
    Category.destroy_all
    Categorization.destroy_all
  end
end

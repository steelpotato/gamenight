class Populate < ActiveRecord::Migration
  def self.up
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
  end
end

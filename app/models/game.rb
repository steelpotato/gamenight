class Game < ActiveRecord::Base
  validates_length_of :title, :within => 1..50, :message => "must be present"
  has_and_belongs_to_many :categories      
  validates_presence_of :description
  has_many :comments                   
  validates_length_of :category_ids, :minimum => 1, :message => "must have at least 1 category"
  
  define_index do 
    indexes title
    indexes description
    indexes categories.name, :as => :category
    indexes comments.body, :as => :comment
      
    has min_players, max_players, created_at
    has categories(:id), :as => :catgory_ids
  end
  
  # This just works!  That is so freaking cool I can't stand it
  def to_param 
    id.to_s + "_" + title.gsub(/\s/, '_').gsub(/[^-\w]/,'').downcase
  end
  
  def self.filter(params)  
    includes = [];
    conditions = {};
    
    conditions[:category_ids] = params[:category] if params.has_key? :category
    
    if params.has_key? :players and params[:players].to_i > 0
      conditions[:min_players] = 1..params[:players].to_i
      conditions[:max_players] = params[:players].to_i..10
    end                 
     
    Game.search params[:q], :with => { :category_ids => 1 } 
    # Game.search params[:q], :with => conditions
    # Game.search params[:q]
  end
  
end

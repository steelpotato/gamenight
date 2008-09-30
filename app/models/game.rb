class Game < ActiveRecord::Base
  
  has_many :comments                   
  has_many :categorizations
  has_many :categories, :through => :categorizations
  # has_many :game_versions

  validates_length_of :category_ids, :minimum => 1, :message => "must have at least 1 category"
  validates_length_of :title, :within => 1..50, :message => "must be present"
  validates_presence_of :description
  
  define_index do 
    indexes title
    indexes description
    indexes categories.name, :as => :category
    indexes comments.body, :as => :comment
      
    has min_players, max_players, created_at
    has categories(:id), :as => :categories
  end
  
  # This just works!  That is so freaking cool I can't stand it
  def to_param 
    id.to_s + "_" + title.gsub(/\s/, '_').gsub(/[^-\w]/,'').downcase      
  end
  
  alias_method :old_save, :save
  def save
    # GameVersion.create :data => self.to_yaml, :game => self
    old_save
  end
  
  def self.filter(params)  
    conditions = {};

    conditions[:categories] = params[:category] if params.has_key? :category
    
    if params.has_key? :players and params[:players].to_i > 0
      conditions[:min_players] = 1..params[:players].to_i
      conditions[:max_players] = params[:players].to_i..10
    end                 
     
    Game.search params[:q], :with => conditions
  end
  
end

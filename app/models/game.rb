class Game < ActiveRecord::Base
  validates_length_of :title, :within => 1..50, :message => "must be present"
  has_and_belongs_to_many :categories
  has_many :comments
  
  acts_as_ferret :fields => [:title, :description]
  
  # This just works!  That is so freaking cool I can't stand it
  def to_param 
    id.to_s + "_" + title.gsub(/\s/, '_').gsub(/[^-\w]/,'').downcase
  end
  
  def self.search (query)
    Game.find_by_contents(query) unless query.nil?
  end
  
  def self.filter(params)  
         
    includes = [];
    conditions = [];
    variables = {};
    
    if params.has_key? :category
      includes << :categories
      conditions << "categories_games.category_id = :category";     
      variables[:category] = params[:category]    
    end                    
    
    if params.has_key? :players and params[:players].to_i > 0
      conditions << "min_players <= :players"
      conditions << "max_players >= :players"
      variables[:players] = params[:players]    
    end                 
    
    finalconditions = conditions.any? ? [conditions.join(' and '), variables] : nil; 
    
    return Game.find(:all, :conditions => finalconditions, :include => includes)
  end
  
end

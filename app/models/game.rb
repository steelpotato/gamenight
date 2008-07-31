class Game < ActiveRecord::Base
  validates_length_of :title, :within => 1..50, :message => "must be present"
  has_and_belongs_to_many :categories      
  validates_presence_of :description
  has_many :comments                   
  validates_length_of :category_ids, :minimum => 1, :message => "must have at least 1 category"
  
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
    
    query = (params.has_key? :q) ? params[:q] : '*'
    
    logger.info 'Query ' + query
    logger.info 'Final Conditions' + finalconditions.to_s
    
    results = Game.find_with_ferret(query, {}, {:conditions => finalconditions, :include => includes})
  end

    # I don't know how to to do this without changing the main find() call
    # if params.has_key? :q 
    # else
    #   results = Game.find(:all, :conditions => finalconditions, :include => includes)
    # end
    
    results
  end
  
end

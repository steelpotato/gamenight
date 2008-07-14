class Game < ActiveRecord::Base
  validates_length_of :title, :within => 1..50, :message => "must be present"
  # validates_presence_of :description, :message => "can't be blank"
  
  def to_param 
    short_title
  end
  
end

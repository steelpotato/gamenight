class Comment < ActiveRecord::Base
  belongs_to :game
  validates_presence_of :body
end

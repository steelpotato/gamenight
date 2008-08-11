class Category < ActiveRecord::Base
  has_many :categorizations                     # You must use this before using the next line
  has_many :games, :through => :categorizations # Map them games
  validates_presence_of :name
end

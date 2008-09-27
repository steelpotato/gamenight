class GameVersion < ActiveRecord::Base
  belongs_to :game
  serialize :data
end

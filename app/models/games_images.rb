class GamesImages < ActiveRecord::Base
  attr_accessible :gameId, :imageUrl, :userId, :votes
end

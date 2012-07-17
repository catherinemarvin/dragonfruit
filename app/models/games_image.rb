class GamesImage < ActiveRecord::Base
  attr_accessible :gameId, :imageUrl, :userSubmitted, :votes
end

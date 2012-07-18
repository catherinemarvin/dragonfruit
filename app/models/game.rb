class Game < ActiveRecord::Base
  attr_accessible :gameId, :sourceImage
  validates :gameId, presence: true, uniqueness: true
  validates :sourceImage, presence: true
end

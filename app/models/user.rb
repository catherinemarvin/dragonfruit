class User < ActiveRecord::Base
  attr_accessible :game, :name

  validates :name, presence: true
  validates :game, presence: true
end

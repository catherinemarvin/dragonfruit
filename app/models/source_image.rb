class SourceImage < ActiveRecord::Base
  attr_accessible :id, :url
  
  validates :url, presence: true
end

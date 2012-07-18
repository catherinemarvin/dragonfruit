class FixGameIdforGamesImage < ActiveRecord::Migration
  def up
  	change_column :games_images, :gameId, :integer
  end

  def down
  	change_column :games_images, :gameId, :string
  end
end

class CreateGamesImages < ActiveRecord::Migration
  def change
    create_table :games_images do |t|
      t.int :gameId
      t.string :imageUrl
      t.int :votes
      t.int :userId

      t.timestamps
    end
  end
end

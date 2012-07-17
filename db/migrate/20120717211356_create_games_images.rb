class CreateGamesImages < ActiveRecord::Migration
  def change
    create_table :games_images do |t|
      t.string :gameId
      t.string :imageUrl
      t.integer :votes
      t.string :userSubmitted

      t.timestamps
    end
  end
end

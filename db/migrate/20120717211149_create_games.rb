class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.integer :gameId
      t.integer :sourceImage

      t.timestamps
    end
  end
end

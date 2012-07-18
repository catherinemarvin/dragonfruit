class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.string :gameId
      t.integer :sourceImage

      t.timestamps
    end
  end
end

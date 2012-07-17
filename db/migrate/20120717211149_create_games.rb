class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.string :id
      t.integer :sourceImage

      t.timestamps
    end
  end
end

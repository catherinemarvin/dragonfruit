class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.int :id
      t.int :sourceimage

      t.timestamps
    end
  end
end

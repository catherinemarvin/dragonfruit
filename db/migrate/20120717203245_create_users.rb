class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.int :id
      t.int :game

      t.timestamps
    end
  end
end

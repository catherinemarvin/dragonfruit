class CreateSourceImages < ActiveRecord::Migration
  def change
    create_table :source_images do |t|
      t.string :url

      t.timestamps
    end
  end
end

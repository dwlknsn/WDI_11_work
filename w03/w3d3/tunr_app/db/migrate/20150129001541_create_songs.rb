class CreateSongs < ActiveRecord::Migration
  def change
    create_table :songs do |t|
      t.string :name
      t.string :price
      t.integer :genre_id

      t.timestamps null: false
    end
  end
end

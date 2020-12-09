class CreateAlbums < ActiveRecord::Migration[5.2]
  def change
    create_table :albums do |t|
      t.string :name, null: false
      t.integer :artist_id, null: false
      t.string :title, null: false
      t.integer :year, null: false
      t.boolean :studio_perfomance, default: true, null:false
      t.timestamps
    end
  end
end

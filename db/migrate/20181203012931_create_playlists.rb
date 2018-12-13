class CreatePlaylists < ActiveRecord::Migration[5.2]
  def change
    create_table :playlists do |t|
      t.string :name
      t.string :picture
      t.text :description
      t.text :ad
      t.belongs_to :user, foreign_key: true

      t.timestamps
    end
  end
end

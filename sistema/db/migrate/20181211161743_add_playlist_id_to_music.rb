class AddPlaylistIdToMusic < ActiveRecord::Migration[5.2]
  def change
    add_column :musics, :playlist_id, :integer
    add_index  :musics, :playlist_id
  end
end
class AddUriToMusics < ActiveRecord::Migration[5.2]
  def change
    add_column :musics, :uri, :string
  end
end

json.extract! music, :id, :artist, :name, :album, :user_id, :created_at, :updated_at
json.url music_url(music, format: :json)

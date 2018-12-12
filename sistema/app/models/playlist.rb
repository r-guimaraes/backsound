class Playlist < ApplicationRecord
  belongs_to :user
  has_one_attached :picture
  has_and_belongs_to_many :musics
end

class ArtistsController < ApplicationController
  RSpotify::authenticate "de75b607b0ac4d0a9894a2535ea1b798", "f2b04c95501344d28a2d8e9eb3f5da7e"

  def index
    unless params[:artist_name].nil?
      if !params[:artist_name].empty?
        @artists = RSpotify::Artist.search(params[:artist_name])
      else
        redirect_to root_path
      end
    end
  end

  def show
    @artist = RSpotify::Artist.find(params[:id])
    @music = Music.new
  end
end

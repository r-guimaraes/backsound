class ArtistsController < ApplicationController
  RSpotify::authenticate "client_id", "client_secret"

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
  end
end

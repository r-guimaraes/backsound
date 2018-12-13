class PlaylistsController < ApplicationController
  before_action :set_playlist, only: [:show, :edit, :update, :destroy]
  before_action :set_songs, only: [:show, :new, :edit]

  def index
    if user_signed_in?
      @playlists = Playlist.where user_id: _id_usuario
    else
      redirect_to root_path
    end
  end

  def show
  end

  def new
    @playlist = Playlist.new
  end

  def edit
  end

  def create
    @playlist = Playlist.new(playlist_params)
    @playlist.token = ('a'..'z').to_a.shuffle[0,7].join

    respond_to do |format|
      if @playlist.save
        format.html { redirect_to @playlist, notice: 'Playlist criada com sucesso!' }
        format.json { render :show, status: :created, location: @playlist }
      else
        format.html { render :new }
        format.json { render json: @playlist.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @playlist.update(playlist_params)
        format.html { redirect_to @playlist, notice: 'Playlist atualizada com sucesso!' }
        format.json { render :show, status: :ok, location: @playlist }
      else
        format.html { render :edit }
        format.json { render json: @playlist.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @playlist.destroy
    respond_to do |format|
      format.html { redirect_to playlists_url, notice: 'Playlist deletada com sucesso!' }
      format.json { head :no_content }
    end
  end

  private

    def _id_usuario
      current_user.id
    end

    def set_playlist
      @playlist = Playlist.find(params[:id])
    end

    def set_songs
      if user_signed_in?
        @songs = Music.where user_id: _id_usuario
      end
    end

    def playlist_params
      params.require(:playlist).permit(:name, :picture, :description, :ad, :user_id, music_ids: [])
    end
end

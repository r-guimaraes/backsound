class MusicsController < ApplicationController
  before_action :set_music, only: [:show, :edit, :update, :destroy]

  def index
    @musics = Music.where(user_id: current_user.id).where.not(uri: [nil, ""])
  end

  def show
  end

  def new
    @music = Music.new
  end

  def edit
  end

  def create
    @music = Music.new(music_params)

    respond_to do |format|
      if @music.save
        format.html { redirect_to @music, notice: 'Música adicionada com sucesso.' }
        format.json { render :show, status: :created, location: @music }
      else
        puts "Erro ao adicionar nova música! Veja mais detalhes abaixo:"
        puts @music.errors.full_messages
        format.html { render :new }
        format.json { render json: @music.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @music.update(music_params)
        format.html { redirect_to @music, notice: 'Música atualizada com sucesso.' }
        format.json { render :show, status: :ok, location: @music }
      else
        format.html { render :edit }
        format.json { render json: @music.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @music.destroy
    respond_to do |format|
      format.html { redirect_to musics_url, notice: 'Música removida com sucesso.' }
      format.json { head :no_content }
    end
  end

  private
    def set_music
      @music = Music.find(params[:id])
    end

    def music_params
      params.require(:music).permit(:artist, :name, :album, :uri, :user_id)
    end
end

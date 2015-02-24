class SongsController < ApplicationController
  def index
  	@songs = Song.all
  end

  def show
  	@song = Song.find(params[:id])
  end

  # create method1 step 1/2
  def new
  	@song = Song.new
  end

  # create method1 step 2/2
  def create
    binding.pry
  	Song.create(song_params)
  	redirect_to(songs_path)
  end

  def edit
  	@song = Song.find(params[:id])
  end

  def update
  	@song = Song.find(params[:id])
  end

  def destroy
  	@song = Song.find(params[:id])
  end

  private
  def song_params
  	params.require(:song).permit(:name, :price, :genre_id, {album_ids: []})
  end
end























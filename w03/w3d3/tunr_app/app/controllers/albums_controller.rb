class AlbumsController < ApplicationController

	def index
		@albums = Album.all
	end

	def show
		@album = Album.find(params[:id])
	end

	def new
		@album = Album.new
	end

	def create
		Album.create(album_params)
		redirect_to(albums_path)
	end

	def edit
		@album = Album.find(params[:id])
	end

	def update
		@album = Album.find(params[:id])
		
	end

	def destroy
		@album = Album.find(params[:id])
	end

	private
	def album_params
		params.require(:album).permit(:name, :song_id)
	end
end
class Song < ActiveRecord::Base
	has_and_belongs_to_many :albums, join_table: :albums_songs
	belongs_to :genre
end

class Album < ActiveRecord::Base

	has_many :genres, through: :songs
	has_and_belongs_to_many :songs
end

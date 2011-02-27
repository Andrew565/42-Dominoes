class Game
	include DataMapper::Resource
	
	property :id, Serial
	property :name, String
	property :description, String, :length => 255
	
	has n, :players
	
	validates_uniqueness_of :name
end
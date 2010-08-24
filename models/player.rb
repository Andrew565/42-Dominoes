class Player
	include DataMapper::Resource
	
	property :id, Serial
	property :name, String
	
	validates_uniqueness_of :name
	
	has 1, :hand
	has n, :dominos, :through => :hand
end
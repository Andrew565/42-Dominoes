class Player
	include DataMapper::Resource
	
	property :id, Serial
	property :name, String
	property :email, String, :length => 100
	
	validates_uniqueness_of :email
	
	has 1, :hand
	has n, :dominos, :through => :hand
	belongs_to :game
end
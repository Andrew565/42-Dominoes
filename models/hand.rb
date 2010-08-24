class Hand
	include DataMapper::Resource
	
	property :id, Serial
	
	has n, :dominos
	belongs_to :player
end
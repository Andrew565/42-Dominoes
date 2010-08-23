class Domino
	include DataMapper::Resource
	
	property :id, Serial
	property :sideA, Integer
	property :sideB, Integer
	property :name, String
	
	validates_uniqueness_of :name
end
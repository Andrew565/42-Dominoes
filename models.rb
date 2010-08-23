%w[domino].each {|model| require File.dirname(__FILE__)+"/models/#{model}"}
DataMapper.finalize
DataMapper.auto_upgrade!

def initialize_dominoes
	#populate the database with dominoes
	0.upto(6) do |intA|
		0.upto(6) do |intB|
			name = (intA >= intB) ? intA.to_s+"-"+intB.to_s : intB.to_s+"-"+intA.to_s
			Domino.create(:sideA => intA, :sideB => intB, :name => name)
		end
	end
end
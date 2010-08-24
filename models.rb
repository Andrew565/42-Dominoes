%w[domino hand player].each {|model| require File.dirname(__FILE__)+"/models/#{model}"}
DataMapper.finalize
DataMapper.auto_upgrade!

def initialize_dominoes
	#populate the database with dominoes
	Domino.destroy
	Hand.destroy
	Player.destroy
	
	(1..4).each do |i|
		player = Player.create(:name => "Player"+i.to_s)
		player.hand = Hand.new(:player => player)
		player.save
	end
	
	pot = Player.create(:name => "Pot")
	pot.hand = Hand.new(:player => pot)
	pot.save
	
	0.upto(6) do |intA|
		0.upto(6) do |intB|
			name = (intA >= intB) ? intA.to_s+"-"+intB.to_s : intB.to_s+"-"+intA.to_s
			domino = Domino.create(:sideA => intA, :sideB => intB, :name => name)
			domino.hand = Hand.first(:name => "Pot")
			domino.save
		end
	end
end
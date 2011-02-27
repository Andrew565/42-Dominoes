%w[domino hand player game].each {|model| require File.dirname(__FILE__)+"/models/#{model}"}
DataMapper.finalize
DataMapper.auto_upgrade!

def initialize_dominoes
	#populate the database with dominoes
	Domino.destroy
	Hand.destroy
	Player.destroy
	Game.destroy
	
	Game.create(:name => "Test Game", :description => "This is a test game for testing purposes.")
	
	(1..4).each do |i|
		player = Player.create(:name => "Player"+i.to_s, :email => "player"+i.to_s+"@")
		player.hand = Hand.new(:player => player)
		player.game = Game.get(1)
		player.save
	end
	
	pot = Player.create(:name => "Pot")
	pot.hand = Hand.new(:player => pot)
	pot.game = Game.get(1)
	pot.save
	
	0.upto(6) do |intA|
		0.upto(6) do |intB|
			name = (intA >= intB) ? intA.to_s+"-"+intB.to_s : intB.to_s+"-"+intA.to_s
			domino = Domino.create(:sideA => intA, :sideB => intB, :name => name)
			domino.hand = pot.hand
			domino.save
		end
	end
end
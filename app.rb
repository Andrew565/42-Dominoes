%w(rubygems sinatra dm-core dm-validations dm-migrations erb pp configure models).each { |lib| require lib}

require "sinatra/reloader" if development?

VERBOSE = false

get '/' do
  erb :index
end

get '/make_dominoes' do
	initialize_dominoes
	erb :shuffle_result
end

get '/dominoes' do
	erb :dominoes_list
end

get '/players' do
	erb :players_list
end

get '/hands' do
	erb :hands_list
end

get '/games' do
  erb :games_list
end

get '/shuffle' do
  pot = Player.first(:name => "Pot")
  
  players = []
  Player.all(:name.not => "Pot").each do |player|
  	players.push(player)
  end
  pp "The Players are: ", players
  
  all_dominos = Domino.all.to_ary
  (0..3).each do |i|
  	current_player = players[i]
  	players_dominos = 0
  	7.times do |x|
  		random_domino = all_dominos.choice
  		p "randomly selected domino is #{random_domino.name}" if VERBOSE
  		random_domino.hand = current_player.hand
  		random_domino.save
  		current_player.save
  		all_dominos.delete(random_domino)
  		players_dominos = players_dominos + 1
  		p "#{current_player.name} has "+players_dominos.to_s+" domino(s)" if VERBOSE
  	end
  end
	
  erb :shuffle_result

end
  	
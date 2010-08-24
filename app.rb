%w(rubygems sinatra dm-core dm-validations dm-migrations erb pp configure models).each { |lib| require lib}

get '/' do
  erb :index
end

get '/make_dominoes' do
	initialize_dominoes
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
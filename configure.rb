#sinatra/environment configuration

configure do #all environments
    
end #configure do

configure :production, :staging do #production and staging environments
  DataMapper.setup(:default, 'sqlite:da_db.sqlite3.db')
  VERBOSE = false
end #configure :production, :staging do

configure :development do #development environment
  DataMapper.setup(:default, 'sqlite:da_db.sqlite3.db')
  VERBOSE = true
end #configure :development do
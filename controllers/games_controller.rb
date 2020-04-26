require('sinatra')
require('sinatra/contrib/all')
require('pry-byebug')
require_relative('../models/team.rb')
require_relative('../models/game.rb')
also_reload('../models/*')

get '/games' do
    @games = Game.all()
    erb(:'games/index')
end

get '/games/new' do
    @teams = Team.all()
    @games = Game.all()
    erb(:'games/new')
end

post '/games' do
    Game.new(params).save
    redirect to '/games'
end

get '/games/:id' do
    @game = Game.find(params['id'].to_i)
    erb(:'games/show')
end
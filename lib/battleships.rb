require 'sinatra/base'
require_relative 'game'
require_relative 'player'


class BattleShips < Sinatra::Base
	set :views, Proc.new { File.join(root, '..', "views") }
	enable :sessions
  
  GAME = Game.new
 
  get '/' do
    erb :index
  end

  get '/name' do
     erb :name 
   
  end

  get '/make_player' do
     player = Player.new 
     GAME.add_player(player) 
     @name = params[:name]
     session[:name] = @name
     player.name = @name
    if @name == ""
      redirect '/name'
    else 
      redirect '/message'
    end
  end

  get '/message' do
    redirect '/placing_ships'if GAME.has_two_players?
    @name = params[:name]
    erb :message
  end

  get '/placing_ships' do
    erb :placing_ships
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end

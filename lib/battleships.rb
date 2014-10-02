require 'sinatra/base'
require_relative 'game'
require_relative 'player'
require_relative 'board'
require_relative 'cell'
require_relative 'ship'



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
    session[:name]= params[:name]
    player.name = session[:name]
    player.board = Board.new(Cell)
    session[:board] = player.board

    if @name == ""
      redirect '/name'
    else 
      redirect '/message'
    end
  end

  get '/message' do
    redirect '/placing_ships'if GAME.has_two_players?
    @name = session[:name]
    erb :message
  end

  get '/placing_ships' do
    @my_board = session[:board]
    erb :placing_ships
  end

  get '/aircraft_carrier' do
    @my_board = session[:board]
    #@ships = [Ship.aircraft_carrier, Ship.battleship, Ship.destroyer, Ship.submarine, Ship.patrol_boat]
    @my_board.place(Ship.aircraft_carrier, params[:coordinate].to_sym, params[:orientation].to_sym)
    erb :aircraft_carrier
  end

  get '/battleship' do
    @my_board = session[:board]
    @my_board.place(Ship.battleship, params[:coordinate].to_sym, params[:orientation].to_sym)
    erb :battleship
  end

  get '/submarine' do
    @my_board = session[:board]
    @my_board.place(Ship.submarine, params[:coordinate].to_sym, params[:orientation].to_sym)
    erb :submarine
  end

  get '/destroyer' do
    @my_board = session[:board]
    @my_board.place(Ship.patrol_boat, params[:coordinate].to_sym, params[:orientation].to_sym)
    erb :destroyer
  end

  get '/shooting' do
    @name = session[:name]
    @my_board = session[:board]
    @enemy_board = Board.new(Cell)
    session[:e_board] = @enemy_board
    erb :shooting
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end

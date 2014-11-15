require 'sinatra/base'
require_relative 'game'
require_relative 'player'
require_relative 'board'
require_relative 'cell'
require_relative 'ship'
require_relative 'water'



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
    if GAME.has_two_players?
      session[:current_player] = :player2
    else 
      session[:current_player] = :player1
    end
    session[:name]= params[:name]
    player.name = session[:name]
    player.board = Board.new(Cell)
    session[:board] = player.board

    if session[:name] == ""
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
    @my_board.place(Ship.destroyer, params[:coordinate].to_sym, params[:orientation].to_sym)
    erb :destroyer
  end

  get '/shooting' do
    @my_board = session[:board]
    @my_board.place(Ship.patrol_boat, params[:coordinate].to_sym, params[:orientation].to_sym)
    @my_board.grid.each {|key, value| value.content = Water.new if value.content.nil?}
    @enemy_board = Board.new(Cell)
    session[:enemy_board] = @enemy_board
    erb :shooting
  end

  get '/shot' do
    @name = session[:name]
    @my_board = session[:board]
    if session[:current_player] == :player1
      GAME.player1.board = @my_board
    else session[:current_player] == :player2
      GAME.player1.board = @my_board
    end
    @enemy_board = session[:enemy_board]
    puts GAME.inspect
    erb :shot
  end

  post '/shot' do
   
    GAME.shoots(params[:coordinates])
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end

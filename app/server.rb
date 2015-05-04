require 'sinatra/base'
require './lib/player'
require './lib/computer'
require './lib/game'

class RPSLS < Sinatra::Base
  set :public_folder, Proc.new { File.join(root, '..', "public") }

  game = Game.new
  computer = Computer.new
  player1 = Player.new("")

  get '/' do
    erb :index
  end

  get '/newgame' do
    erb :newgame
  end

  post '/newgame' do
    if params[:name].empty?
      @message = "What is your name?"
      erb :newgame
    else
      player1 = Player.new(params[:name])
      @player1 = player1.name
      erb :newgame
    end
  end

  get '/play' do
    erb :play
  end

  post '/play' do
    player1.make_move(params[:weapons].to_i)
    computer.random
    game.compare(player1, computer)
    game.winner == :draw ? @winner="DRAW" : @winner=game.winner.name
    erb :play
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end

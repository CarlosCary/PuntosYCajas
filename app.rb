require 'sinatra'
require './lib/Tablero'

class App < Sinatra::Base

    get '/partida' do 
        @prueba = [1, 2, 3, 4, 5]
        erb :partida2
    end

    # get '/partida' do
    #     erb:partida
    # end

    post '/jugada' do
        tablero = Tablero.new
    end
    
    run! if app_file == $0;
end
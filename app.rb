require 'sinatra'
require '.lib/tablero'
class App < Sinatra::Base

    get '/' do 
        erb:partida
    end

    get '/partida' do
        erb:partida
    end

    post '/jugada' do
        tablero= Tablero.new
        
    end
    
    run! if app_file == $0;
end
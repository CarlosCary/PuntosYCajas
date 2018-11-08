require 'sinatra'
require './lib/Tablero'

class App < Sinatra::Base
    
    $tablero = Tablero.new

    get '/partida' do 
        @tam = 4
        @filas = $tablero.obtenerFilas
        @columnas = $tablero.obtenerColumnas
        erb :partida2
    end

    get '/partidaJugando' do 
        @tam = 4
        $tablero.convertirCoordenadasAFilasOColumnas(0, 0, 0, 1)
        @filas = $tablero.obtenerFilas
        @columnas = $tablero.obtenerColumnas
        erb :partida2
    end


    post '/partidaJugando1' do
        $tablero.convertirCoordenadasAFilasOColumnas(params[:punto1PosX].to_i, params[:punto1PosY].to_i, params[:punto2PosX].to_i, params[:punto2PosY].to_i)
        @filas = $tablero.obtenerFilas
        @columnas = $tablero.obtenerColumnas
        @tam = $tablero.obtenerTamanhio
        
        erb :partida2
    end

    post '/jugada' do
        tablero = Tablero.new
    end
    
    run! if app_file == $0;
end
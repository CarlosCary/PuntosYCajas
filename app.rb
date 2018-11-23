require 'sinatra'
require './lib/tablero'

class App < Sinatra::Base
    $tablero = Tablero.new(4)

    get '/' do
        erb:bienvenida
    end
    post '/configuracion' do
        erb:configuracion
    end

    get '/partida' do 
        @tam = 4
        @filas = $tablero.obtenerFilas
        @columnas = $tablero.obtenerColumnas
        erb :partida
    end

    get '/partidaJugando' do 
        @tam = 4
        $tablero.convertirCoordenadasAFilasOColumnas(0, 0, 0, 1)
        @filas = $tablero.obtenerFilas
        @columnas = $tablero.obtenerColumnas
        erb :partida
    end

    post '/partidaJugando1' do
        #$tablero.convertirCoordenadasAFilasOColumnas(params[:punto1PosX].to_i, params[:punto1PosY].to_i, params[:punto2PosX].to_i, params[:punto2PosY].to_i)
        $tablero.insertarFilasOColumnas(params[:numeroCaja].to_i, params[:direccionLinea].to_s)
        @filas = $tablero.obtenerFilas
        @columnas = $tablero.obtenerColumnas
        @tam = $tablero.obtenerTamanhio 
        erb :partida
    end

    post '/jugada' do
        tablero = Tablero.new
    end
    
    run! if app_file == $0;
end
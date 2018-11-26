require 'sinatra'
require './lib/tablero'

class App < Sinatra::Base
    $tablero

    get '/' do
        erb :bienvenida
    end

    post '/configuracion' do
        erb :configuracion
    end

    post '/iniciarPartida' do
        $tablero = Tablero.new(params[:tamTablero].to_i)
        @filas = $tablero.obtenerFilas
        @columnas = $tablero.obtenerColumnas
        @tam = $tablero.obtenerTamanhio
        @cajaMaxima = (((@tam-1) * (@tam-1) ) -1 ).to_s
        erb :partida
    end

    get '/partida' do 
        @tam = $tablero.obtenerTamanhio
        #@tam = 4
        @cajaMaxima = (((@tam-1) * (@tam-1) ) -1 ).to_s
        @filas = $tablero.obtenerFilas
        @columnas = $tablero.obtenerColumnas
        @table = $tablero
        
        erb :partida
    end

    get '/partidaJugando' do 
        @tam = $tablero.obtenerTamanhio
        @numeroCaja = 1100
        #$tablero.insertarFilasOColumnas(0, 'arriba')
        @filas = $tablero.obtenerFilas
        @columnas = $tablero.obtenerColumnas
        
        erb :partida
    end

    post '/partidaJugando1' do
        @numeroCaja = 1
        $tablero.insertarFilasOColumnas(params[:numeroCaja].to_i, params[:direccionLinea].to_s)
        @filas = $tablero.obtenerFilas
        @columnas = $tablero.obtenerColumnas
        @tam = $tablero.obtenerTamanhio 
        @table = $tablero
        erb :partida
    end

    post '/jugada' do
        tablero = Tablero.new
    end
    
    run! if app_file == $0;
end
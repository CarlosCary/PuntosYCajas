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
        $tablero = Tablero.new(params[:tamTablero].to_i,params[:numJugadores].to_i)
        $tablero.inicializarJugadores(params[:numJugadores].to_i)
        @jugadores=$tablero.obtenerJugadores
        @filas = $tablero.obtenerFilas
        @columnas = $tablero.obtenerColumnas
        @numJugadores = @jugadores.length
        @tam = $tablero.obtenerTamanhio
        @htmlTablero = $tablero.crearTablero()
        erb :partida
    end

    get '/partida' do 
        @tam = $tablero.obtenerTamanhio
        @jugadores=$tablero.obtenerJugadores
        @numJugadores=@jugadores.length
        @cajaMaxima = (((@tam-1) * (@tam-1) ) -1 ).to_s
        @filas = $tablero.obtenerFilas
        @columnas = $tablero.obtenerColumnas
        @table = $tablero
        @htmlTablero = $tablero.crearTablero()
        erb :partida
    end

    get '/partidaJugando' do 
        
        @tam = 4
        @jugadores=$tablero.obtenerJugadores
        @numJugadores=@jugadores.length
        $tablero.insertarFilasOColumnas(0, 'arriba')
        @filas = $tablero.obtenerFilas
        @columnas = $tablero.obtenerColumnas
        @htmlTablero = $tablero.crearTablero()
        erb :partida
    end

    post '/partidaJugando1' do
        
        @numeroCaja = 1
        @tam = $tablero.obtenerTamanhio
        @jugadores=$tablero.obtenerJugadores
        @numJugadores=@jugadores.length
        $tablero.insertarFilasOColumnas(params[:numeroCaja].to_i, params[:direccionLinea].to_s)
        @filas = $tablero.obtenerFilas
        @columnas = $tablero.obtenerColumnas
        @tam = $tablero.obtenerTamanhio 
        @table = $tablero
        @htmlTablero = $tablero.crearTablero()
        erb :partida
    end

    post '/jugada' do
        tablero = Tablero.new
    end
    
    run! if app_file == $0;
end
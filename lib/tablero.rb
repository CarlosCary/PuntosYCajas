require './lib/linea'
require './lib/jugador'
class Tablero
    attr_accessor :turno
    def initialize(tam,numJugadores)
        @tamanhio = tam
        @numeroDeJugadores = numJugadores
        @arregloFilas = true
        @arregloColumnas = true 
        @filas = Array.new(tam) { Array.new(tam-1) {Linea.new} }
        @columnas = Array.new(tam-1) { Array.new(tam) {Linea.new} }
        @jugadores = Array.new(numJugadores) {Jugador.new}
        @turno = 0     
        @coloresDisponibles = ["red", "blue", "brown", "darkgreen"]
    end

    def inicializarJugadores(num)
        for i in 1..num
            @jugadores[i - 1].nombre = "Jugador " + i.to_s
            @jugadores[i - 1].color = @coloresDisponibles[i - 1]
        end
    end

    def obtenerNombreDeJugador(num)
        return @jugadores[num].nombre
    end

    def obtenerColorDeJugador(num)
        return @jugadores[num].color
    end

    def configurarColorDeJugador(num,colorJug)
         @jugadores[num].color=colorJug
    end

    def configurarNombreDeJugador(num,nomJugador)
         @jugadores[num].nombre=nomJugador
    end

    def comprobarSiFilaEstaVacia(posX, posY)
        if(@filas[posX][posY].lineaEstaDibujada())
            return false
        else
            return true
        end
    end
    
    def comprobarSiColumnaEstaVacia(posX, posY)
        if(@columnas[posX][posY].lineaEstaDibujada())
            return false
        else
            return true
        end
    end

    def incrementarTurnoYComprobarPuntaje(puntaje)
        if(puntaje == 0)
            @turno += 1
        else
            @jugadores[turno].puntaje += puntaje
        end
        if(@turno > (@numeroDeJugadores - 1))
            @turno = 0        
        end
    end

    def insertarFilasOColumnas(numeroCaja, direccionLinea)
        coordX = nil
        coordY = nil
        puntaje = 0
        if(direccionLinea == "arriba" || direccionLinea == "abajo")
            arrayCoordenadas = convertirNumeroDeCajaAFilaYDireccionACoordenadasFila(numeroCaja, direccionLinea)
            if(comprobarSiFilaEstaVacia(arrayCoordenadas[0],arrayCoordenadas[1]))
                puntaje += insertarFila(arrayCoordenadas[0],arrayCoordenadas[1])
                incrementarTurnoYComprobarPuntaje(puntaje)
            end
        else
            arrayCoordenadas = convertirNumeroDeCajaYDireccionACoordenadasColumna(numeroCaja, direccionLinea)
            if(comprobarSiColumnaEstaVacia(arrayCoordenadas[0],arrayCoordenadas[1]))
                puntaje += insertarColumna(arrayCoordenadas[0],arrayCoordenadas[1])
                incrementarTurnoYComprobarPuntaje(puntaje)
            end
        end
        
        return puntaje
    end

    def convertirNumeroDeCajaAFilaYDireccionACoordenadasFila(numeroCaja, direccionLinea)
        contadorCaja = 0
        coordX = nil
        coordY = nil
        if(direccionLinea == "arriba")
            for i in 0..@tamanhio-1
                for j in 0..@tamanhio-2              
                        if(numeroCaja == contadorCaja)                            
                                coordX = i
                                coordY = j
                        end                
                    contadorCaja += 1
                end
            end                        
        else
            for i in 0..@tamanhio-1
                for j in 0..@tamanhio-2 
                    if (numeroCaja==contadorCaja)
                             coordX=i+1
                             coordY=j
                    end
                    contadorCaja+=1
                end
            end     
        end
        return coordX, coordY
    end

    def convertirNumeroDeCajaYDireccionACoordenadasColumna(numeroCaja, direccionLinea)
        contadorCaja = 0
        coordX = nil
        coordY = nil
        if(direccionLinea == "izquierda")
            for i in 0..@tamanhio-2
                for j in 0..@tamanhio-2
                        if(numeroCaja==contadorCaja)
                                coordX = i
                                coordY = j
                        end     
                  contadorCaja+=1               
                end
            end                        
        else
            for i in 0..@tamanhio-2
                for j in 0..@tamanhio-2
                    if (numeroCaja==contadorCaja)
                            coordX = i
                            coordY = j + 1
                    end 
                   contadorCaja+=1
                end
            end  
        end
        return coordX,coordY
    end

    def arregloFilasEstaVacio()
        return @arregloFilas
    end

    def arregloColumnasEstaVacio()
        return @arregloColumnas
    end

    def insertarFila(posX, posY)
        @filas[posX][posY].dibujar(@jugadores[@turno].color)
        @arregloFilas = false
        puntaje = verificarSiSeFormaUnaCajaAbajoConFila(posX, posY)
        puntaje += verificarSiSeFormaUnaCajaArribaConFila(posX, posY)
        return puntaje
    end

    def insertarColumna(posX, posY)

        @columnas[posX][posY].dibujar(@jugadores[@turno].color)
        @arregloColumnas = false
        
        puntaje = verificarSiSeFormaUnaCajaDerechaConColumna(posX, posY)
        puntaje += verificarSiSeFormaUnaCajaIzquierdaConColumna(posX, posY)
        
        return puntaje
    end

    def comprobarSiExisteColumnaDibujadaEnPos(posX,posY)
        return @columnas[posX][posY].dibujado
    end

    def verificarSiSeFormaUnaCajaAbajoConFila(posX,posY)
        puntaje = 0
        if(posX < @tamanhio-1)
            if(@filas[posX+1][posY].lineaEstaDibujada())
                if(@columnas[posX][posY].lineaEstaDibujada())
                    if(@columnas[posX][posY+1].lineaEstaDibujada())
                        puntaje += 1
                    end
                end
            end
        end
        return puntaje
    end

    def verificarSiSeFormaUnaCajaArribaConFila(posX,posY)
        puntaje=0
        if(posX>0)
            if(@filas[posX-1][posY].lineaEstaDibujada())
                if(@columnas[posX-1][posY].lineaEstaDibujada())
                    if(@columnas[posX-1][posY+1].lineaEstaDibujada())
                        puntaje+=1
                    end
                end
            end
        end
        return puntaje
    end

    def verificarSiSeFormaUnaCajaIzquierdaConColumna(posX,posY)
        puntaje = 0  
        if(posY > 0)
            if(@columnas[posX][posY-1].lineaEstaDibujada())
                if(@filas[posX][posY-1].lineaEstaDibujada())
                    if(@filas[posX+1][posY-1].lineaEstaDibujada())
                        puntaje+=1
                    end
                end
            end
        end
        return puntaje
    end

    def verificarSiSeFormaUnaCajaDerechaConColumna(posX, posY)
        puntaje = 0
        if(posY < @tamanhio-1)
            
            if(@columnas[posX][posY + 1].lineaEstaDibujada())
                
                if(@filas[posX][posY].lineaEstaDibujada())
                   
                    if(@filas[posX + 1][posY].lineaEstaDibujada())
                        
                        puntaje+=1
                    end
                end
            end
        end
        return puntaje
    end
    
    def obtenerFilas()
        return @filas
    end

    def obtenerJugadores()
        return @jugadores
    end

    def obtenerColumnas()
        return @columnas
    end
    
    def obtenerTamanhio()
        return @tamanhio
    end

    def obtenerUnaFila(posX, posY)
        return @filas[posX][posY]
    end

    def obtenerUnaColumna(posX, posY)
        return @columnas[posX][posY]
    end

    def pintarCaja(numeroCaja)
        contadorCaja = 0
        colorCaja = ""
        
        cordenadasArriba = convertirNumeroDeCajaAFilaYDireccionACoordenadasFila(numeroCaja, "arriba")
        cordenadasAbajo = convertirNumeroDeCajaAFilaYDireccionACoordenadasFila(numeroCaja, "abajo")
        cordenadasIzquierda = convertirNumeroDeCajaYDireccionACoordenadasColumna(numeroCaja, "izquierda")
        cordenadasDerecha = convertirNumeroDeCajaYDireccionACoordenadasColumna(numeroCaja, "derecha")

        if(!comprobarSiFilaEstaVacia(cordenadasArriba[0], cordenadasArriba[1]))
            colorCaja = "border-top-color:" + @filas[cordenadasArriba[0]][cordenadasArriba[1]].obtenerColor() + ";"
        end    
    
        if(!comprobarSiFilaEstaVacia(cordenadasAbajo[0], cordenadasAbajo[1]))
            colorCaja += "border-bottom-color:" + @filas[cordenadasAbajo[0]][cordenadasAbajo[1]].obtenerColor() + ";"
        end
    
        if(!comprobarSiColumnaEstaVacia(cordenadasIzquierda[0], cordenadasIzquierda[1]))
            colorCaja += "border-left-color:" + @columnas[cordenadasIzquierda[0]][cordenadasIzquierda[1]].obtenerColor() + ";"
        end
    
        if(!comprobarSiColumnaEstaVacia(cordenadasDerecha[0], cordenadasDerecha[1]))
            colorCaja += "border-right-color:" + @columnas[cordenadasDerecha[0]][cordenadasDerecha[1]].obtenerColor() + ";"
        end
        
        return colorCaja;
    end

end
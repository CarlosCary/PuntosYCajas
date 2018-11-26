require './lib/linea'
class Tablero
    def initialize(tam)
        @tamanhio = tam
        @arregloFilas = true
        @arregloColumnas = true 
        @filas = Array.new(tam) { Array.new(tam-1) {Linea.new} }
        @columnas = Array.new(tam-1) { Array.new(tam) {Linea.new} }
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

    def insertarFilasOColumnas(numeroCaja, direccionLinea)
        coordX = nil
        coordY = nil
        puntaje = 0
        if(direccionLinea == "arriba" || direccionLinea == "abajo")
            arrayCoordenadas = convertirNumeroDeCajaAFilaYDireccionACoordenadasFila(numeroCaja, direccionLinea)
            if(arrayCoordenadas.any?)
                puntaje += insertarFila(arrayCoordenadas[0],arrayCoordenadas[1])
            end
        else
            arrayCoordenadas = convertirNumeroDeCajaYDireccionACoordenadasColumna(numeroCaja, direccionLinea)
            if(arrayCoordenadas.any?)
                puntaje += insertarColumna(arrayCoordenadas[0],arrayCoordenadas[1])
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
        @filas[posX][posY].dibujar("red")
        @arregloFilas = false
        puntaje = verificarSiSeFormaUnaCajaAbajoConFila(posX, posY)
        puntaje += verificarSiSeFormaUnaCajaArribaConFila(posX, posY)
        return puntaje
    end

    def insertarColumna(posX, posY)
        
        @columnas[posX][posY].dibujar("red")
        
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
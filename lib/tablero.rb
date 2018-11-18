class Tablero

    def initialize()
        @tamanhio = 4
        @arregloFilas = true
        @arregloColumnas = true
        @filas= Array.new(4) { Array.new(3, false) }
        @columnas= Array.new(3) { Array.new(4, false) }
    end

    def verificarAdyacencia(coordX, coordY, coordX2, coordY2)
        sonAdyacentes=false
        distanciaX=(coordX-coordX2).abs
        distanciaY=(coordY-coordY2).abs
        if(distanciaX!=distanciaY)
            if((distanciaX<=1)&&(distanciaY<=1))            
                sonAdyacentes=true
            end
        end
        return sonAdyacentes
    end
    

    def convertirCoordenadasAFilasOColumnas(coordX, coordY, coordX2, coordY2)
        if(verificarAdyacencia(coordX, coordY, coordX2, coordY2))
            if(coordX == coordX2)
                coordenadaColumna = [coordY,coordY2].min
                insertarColumna(coordenadaColumna, coordX)
            end
            if(coordY == coordY2)
                coordenadaFila = [coordX,coordX2].min
                insertarFila(coordY,coordenadaFila)
            end
        end
    end

    def arregloFilasEstaVacio()
        return @arregloFilas
    end

    def arregloColumnasEstaVacio()
        return @arregloColumnas
    end

    def insertarFila(posX, posY)
        @filas[posX][posY] = true
        @arregloFilas = false
        puntaje = verificarSiSeFormaUnaCajaAbajoConFila(posX,posY)
        puntaje += verificarSiSeFormaUnaCajaArribaConFila(posX,posY)
        return puntaje
    end

    def insertarColumna(posX, posY)
        @arregloColumnas = false
        @columnas[posX][posY] = true
        puntaje = verificarSiSeFormaUnaCajaDerechaConColumna(posX,posY)
        puntaje += verificarSiSeFormaUnaCajaIzquierdaConColumna(posX,posY)
        return puntaje
    end

    def comprobarSiExisteColumnaDibujadaEnPos(posX,posY)
        return @columnas[posX][posY]
    end

    def verificarSiSeFormaUnaCajaAbajoConFila(posX,posY)
        puntaje = 0
        if(posX < 3)
            if(@filas[posX+1][posY] == true)
                if(@columnas[posX][posY] == true)
                    if(@columnas[posX][posY+1] == true)
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
            if(@filas[posX-1][posY]==true)
                if(@columnas[posX-1][posY]==true)
                    if(@columnas[posX-1][posY+1]==true)
                        puntaje+=1
                    end
                end
            end
        end
        return puntaje
    end
    def verificarSiSeFormaUnaCajaIzquierdaConColumna(posX,posY)
        puntaje=0  
        if(posY>0)
            if(@columnas[posX][posY-1]==true)
                if(@filas[posX][posY-1]==true)
                    if(@filas[posX+1][posY-1]==true)
                        puntaje+=1
                    end
                end
            end
        end
        return puntaje
    end
    def verificarSiSeFormaUnaCajaDerechaConColumna(posX,posY)
        puntaje=0
        if(posY<3)
            if(@columnas[posX][posY+1]==true)
                if(@filas[posX][posY]==true)
                    if(@filas[posX+1][posY]==true)
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

    def obtenerUnaFila(posX,posY)
        return @filas[posX][posY]
    end

    def obtenerUnaColumna(posX,posY)
        return @columnas[posX][posY]
    end
end
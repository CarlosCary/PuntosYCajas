class Tablero

    def initialize()
        @arregloFilas=true
        @arregloColumnas=true
        @columnas= Array.new(4) { Array.new(4, 0) }
        @filas= Array.new(4) { Array.new(4, 0) }
    end

    def inicializarColumnasFilas()
        for i in 0..4
            for j in 0..4
                @columnas[i][j] = false
                @filas[i][j] = false
            end
        end
    end

    def convertirCoordenadasAFilasOColumnas(coordX,coodY,coordX2,coordY2)
        if(coordX == coordX2)
        end
        if(coordY == coordY2)
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
        @columnas[posX][posY] = true
        @arregloColumnas = false
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
            if(@filas[posX][posY+1] == true)
                if(@columnas[posX][posY] == true)
                    if(@columnas[posX+1][posY+1] == true)
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
            if(@filas[posX][posY-1]==true)
                if(@columnas[posX][posY-1]==true)
                    if(@columnas[posX+1][posY-1]==true)
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
            if(@columnas[posX-1][posY]==true)
                if(@filas[posX-1][posY]==true)
                    if(@filas[posX-1][posY+1]==true)
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
            if(@columnas[posX+1][posY]==true)
                if(@filas[posX][posY]==true)
                    if(@filas[posX][posY+1]==true)
                        puntaje+=1
                    end
                end
            end
        end
        return puntaje
    end
end
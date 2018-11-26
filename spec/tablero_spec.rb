require "./lib/tablero"
require "./lib/linea"
describe Tablero do

    before(:each) do
        @tb = Tablero.new(4,2)
    end

    it "filas y columnas deberian estar vacias al crearlas" do
        expect(@tb.arregloFilasEstaVacio()).to eq true
        expect(@tb.arregloColumnasEstaVacio()).to eq true
      end
  
      it "Al insertar una fila, el valor de disponibilidad en el tablero deberia cambiar a false" do
          @tb.insertarFila(0,0)
          expect(@tb.comprobarSiFilaEstaVacia(0,0)).to eq false
      end
  
      it "Al insertar una columna, el valor de disponibilidad en el tablero deberia cambiar a false" do
          @tb.insertarColumna(0,0)
          expect(@tb.comprobarSiColumnaEstaVacia(0,0)).to eq false
      end
  
      it "Las coordenadas correspondientes a la entrada caja '0' y direccion de linea 'arriba' deberian ser '[0][0]' de la matriz de filas " do
          array=@tb.convertirNumeroDeCajaAFilaYDireccionACoordenadasFila(0,"arriba")
          expect(array[0]).to eq 0
          expect(array[1]).to eq 0
      end
  
      it "Las coordenadas correspondientes a la entrada caja '0' y direccion de linea 'abajo' deberian ser '[1][0] de la matriz de filas' " do
          array=@tb.convertirNumeroDeCajaAFilaYDireccionACoordenadasFila(0,"abajo")
          expect(array[0]).to eq 1
          expect(array[1]).to eq 0
      end
  
      it "Las coordenadas correspondientes a la entrada caja '0' y direccion de linea 'izquierda' deberian ser '[0][0]' de la matriz de columnas " do
          array=@tb.convertirNumeroDeCajaYDireccionACoordenadasColumna(0,"izquierda")
          expect(array[0]).to eq 0
          expect(array[1]).to eq 0
      end
  
      it "Las coordenadas correspondientes a la entrada caja '0' y direccion de linea 'derecha' deberian ser '[0][1]' de la matriz de columnas " do
          array = @tb.convertirNumeroDeCajaYDireccionACoordenadasColumna(0,"derecha")
          expect(array[0]).to eq 0
          expect(array[1]).to eq 1
      end
  
      it "arreglo de filas no deberia estar vacio al insertar un elemento" do
          @tb.insertarFila(0,0)
          expect(@tb.arregloFilasEstaVacio()).to eq false
      end
  
      it "arreglo de columnas no deberia estar vacio al insertar un elemento" do
          @tb.insertarColumna(0,0)
          expect(@tb.arregloColumnasEstaVacio()).to eq false
      end
  
      it "al insertar un elemento en la primera columna del tablero, se dibuja" do
          @tb.insertarColumna(0,0)
          expect(@tb.comprobarSiExisteColumnaDibujadaEnPos(0,0)).to eq true
      end
  
      it "llenar una fila no proporciona un punto si no existen lineas adyacentes para completar una 'caja' debajo de la fila" do
          expect(@tb.insertarFila(0,0)).to eq 0
          expect(@tb.insertarColumna(0,0)).to eq 0
          expect(@tb.insertarColumna(0,1)).to eq 0
          expect(@tb.verificarSiSeFormaUnaCajaAbajoConFila(0,0)).to eq 0
      end
  
      
      it "llenar una fila no proporciona un punto si no existen lineas adyacentes para completar una 'caja' encima de la fila" do
          expect(@tb.insertarFila(1,0)).to eq 0
          expect(@tb.insertarColumna(0,0)).to eq 0
          expect(@tb.insertarColumna(0,1)).to eq 0
          expect(@tb.verificarSiSeFormaUnaCajaArribaConFila(1,0)).to eq 0
      end
      
  
      it "llenar una columna no proporciona un punto si no existen lineas adyacentes para completar la 'caja' a la izquierda de la columna" do
          expect(@tb.insertarFila(0,0)).to eq 0
          expect(@tb.insertarFila(0,1)).to eq 0
          expect(@tb.insertarColumna(0,1)).to eq 0
          expect(@tb.verificarSiSeFormaUnaCajaIzquierdaConColumna(0,1)).to eq 0
      end
  
      it "llenar una columna no proporciona un punto si no existen lineas adyacentes para completar la 'caja' a la derecha de la columna" do
          expect(@tb.insertarFila(0,0)).to eq 0
          expect(@tb.insertarFila(0,1)).to eq 0
          expect(@tb.insertarColumna(0,0)).to eq 0
          expect(@tb.verificarSiSeFormaUnaCajaIzquierdaConColumna(0,0)).to eq 0
      end
  
      it "llenar una fila de arriba para formar una 'caja' proporciona un punto" do
          expect(@tb.insertarColumna(0,0)).to eq 0
          expect(@tb.insertarColumna(0,1)).to eq 0
          expect(@tb.insertarFila(1,0)).to eq 0
          expect(@tb.insertarFila(0,0)).to eq 1
          expect(@tb.verificarSiSeFormaUnaCajaAbajoConFila(0,0)).to eq 1
      end
  
      it "llenar una columna de la derecha para formar una 'caja' proporciona un punto" do
          expect(@tb.insertarFila(0,0)).to eq 0
          expect(@tb.insertarFila(1,0)).to eq 0
          expect(@tb.insertarColumna(0,0)).to eq 0
          expect(@tb.insertarColumna(0,1)).to eq 1
          expect(@tb.verificarSiSeFormaUnaCajaIzquierdaConColumna(0,1)).to eq 1
      end
  
      it "llenar una fila de abajo para formar una 'caja' proporciona un punto" do
          expect(@tb.insertarColumna(0,0)).to eq 0
          expect(@tb.insertarColumna(0,1)).to eq 0
          expect(@tb.insertarFila(0,0)).to eq 0
          expect(@tb.insertarFila(1,0)).to eq 1
          expect(@tb.verificarSiSeFormaUnaCajaArribaConFila(1,0)).to eq 1
      end

    it "llenar una columna de la izquierda para formar una 'caja' proporcionan un punto" do
        expect(@tb.insertarFila(0,0)).to eq 0
        expect(@tb.insertarFila(1,0)).to eq 0
        expect(@tb.insertarColumna(0,1)).to eq 0
        expect(@tb.insertarColumna(0,0)).to eq 1
        expect(@tb.verificarSiSeFormaUnaCajaDerechaConColumna(0,0)).to eq 1
    end

    
    it "llenar una columna de la izquierda para formar una 'caja' proporcionan al jugador cuyo turno " do
        expect(@tb.insertarFila(0,0)).to eq 0
        expect(@tb.insertarFila(1,0)).to eq 0
        expect(@tb.insertarColumna(0,1)).to eq 0
        expect(@tb.insertarColumna(0,0)).to eq 1
        expect(@tb.verificarSiSeFormaUnaCajaDerechaConColumna(0,0)).to eq 1
    end

    it "llenar una fila 'arriba' en la caja '0' deberia cambiar el valor a 'true' de la matriz '@filas' en la posicion '0,0'" do
        @tb.insertarFilasOColumnas(0,"arriba")
        expect(@tb.comprobarSiFilaEstaVacia(0,0)).to eq false
    end

    it "llenar una fila 'abajo' en la caja '0' deberia cambiar el valor a 'false' de la matriz '@filas' en la posicion '1,0'" do
        @tb.insertarFilasOColumnas(0,"abajo")
        expect(@tb.comprobarSiFilaEstaVacia(1,0)).to eq false
    end

    it "llenar una columna 'izquierda' en la caja '0' deberia cambiar el valor a 'false' de la matriz '@columnas' en la posicion '0,0'" do
        @tb.insertarFilasOColumnas(0,"izquierda")
        expect(@tb.comprobarSiColumnaEstaVacia(0,0)).to eq false
    end

    it "llenar una columna 'derecha' en la caja '0' deberia dibujar la linea de la matriz '@columnas' en la posicion '0,1'" do
        @tb.insertarFilasOColumnas(0, "derecha")
        expect(@tb.comprobarSiColumnaEstaVacia(0, 1)).to eq false
    end

    it "cuando dibujo una linea en la caja 3 arriba y esta disponible deberia pintarse de un color" do
        @tb.inicializarJugadores(2)
        @tb.insertarFilasOColumnas(3, "arriba")
        expect(@tb.pintarCaja(3)).to eq "border-top-color:red;"
    end

    it "los jugadores no deberian tener nombre inicialmente" do
        expect(@tb.obtenerNombreDeJugador(0)).to eq ""
        expect(@tb.obtenerNombreDeJugador(1)).to eq ""
    end

    it "los jugadores no deberian tener color inicialmente" do
        expect(@tb.obtenerColorDeJugador(0)).to eq ""
        expect(@tb.obtenerColorDeJugador(1)).to eq ""
    end

    it "deberia poder cambiar el color de un jugador" do
        @tb.configurarColorDeJugador(0,"red")
        expect(@tb.obtenerColorDeJugador(0)).to eq "red"
    end

    it "deberia poder cambiar el nombre de un jugador" do
        @tb.configurarNombreDeJugador(0,"carlos")
        expect(@tb.obtenerNombreDeJugador(0)).to eq "carlos"
    end

    it "cuando inicializo una partida con dos jugadores los nombres por defecto son 'Jugador 1' y 'Jugador 2'" do
        @tb.inicializarJugadores(2)
        expect(@tb.obtenerNombreDeJugador(0)).to eq "Jugador 1"
        expect(@tb.obtenerNombreDeJugador(1)).to eq "Jugador 2"
    end

    it "cuando inicializo una partida con dos jugadores los colores por defecto son 'red' y 'blue'" do
        @tb.inicializarJugadores(2)
        expect(@tb.obtenerColorDeJugador(0)).to eq "red"
        expect(@tb.obtenerColorDeJugador(1)).to eq "blue"
    end

    it "cuando inicializo un juego el turno deberia ser el del primer jugador" do
        expect(@tb.turno).to eq 0
    end

    it "luego de que el primer jugador realiza su jugada el turno deberia ser el del segundo jugador" do
        @tb.insertarFilasOColumnas(0,"arriba")
        expect(@tb.turno).to eq 1
    end

    it "cuando un jugador dibuja una linea que completa dos cajas se le asigna dos puntos " do
        expect(@tb.insertarFila(0,0)).to eq 0
        expect(@tb.insertarFila(1,0)).to eq 0
        expect(@tb.insertarColumna(0,0)).to eq 0
        expect(@tb.insertarColumna(0,2)).to eq 0
        expect(@tb.insertarFila(1,1)).to eq 0
        expect(@tb.insertarFila(0,1)).to eq 0
        expect(@tb.insertarColumna(0,1)).to eq 2
    end

end
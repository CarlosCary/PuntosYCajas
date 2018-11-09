require "./lib/tablero"
describe Tablero do
    before(:each) do
        @tb=Tablero.new()
    end
    it "filas y columnas deberian estar vacias al crearlas" do
      expect(@tb.arregloFilasEstaVacio()).to eq true
      expect(@tb.arregloColumnasEstaVacio()).to eq true
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

    it "llenar columnas y filas no adyacentes para formar una 'caja' no proporcionan ningun punto" do
        expect(@tb.insertarFila(0,0)).to eq 0
        expect(@tb.insertarFila(1,0)).to eq 0
        expect(@tb.insertarColumna(0,0)).to eq 0
        expect(@tb.insertarColumna(0,1)).to eq 0
    end

    it "los puntos (0,0) y (2,2) no deberian ser adyacentes" do
        expect(@tb.verificarAdyacencia(0,0,1,1)).to eq false
        end

    it "no deberia insertar una linea entre dos puntos no adyacentes" do
    @tb.convertirCoordenadasAFilasOColumnas(0,0,2,2)
    expect(@tb.comprobarSiExisteColumnaDibujadaEnPos(0,0)).to eq false
    end

end
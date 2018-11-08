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

    it "llenar columnas y filas adyacentes para formar una 'caja' proporciona un punto" do
        expect(@tb.insertarFila(1,2)).to eq 0
        expect(@tb.insertarFila(1,3)).to eq 0
        expect(@tb.insertarColumna(1,2)).to eq 0
        expect(@tb.insertarColumna(2,2)).to eq 1
    end

end
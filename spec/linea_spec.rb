require "./lib/linea"
describe Linea do

    before(:each) do
        @ln=Linea.new()
    end

    it "la linea no deberia estar dibujada" do
        expect(@ln.lineaEstaDibujada()).to eq false
    end

    it "deberia poder dibujar la linea" do
        @ln.dibujar("#ff0000")
        expect(@ln.lineaEstaDibujada()).to eq true
    end

    it "la linea deberia ser de color negro inicialmente" do
        expect(@ln.obtenerColor()).to eq "#000000"
    end

    it "luego de dibujar la linea deberia cambiar de color" do 
        @ln.dibujar("#ff0000")
        expect(@ln.obtenerColor()).to eq "#ff0000"
    end

    it "cuando el jugador 1 dibuja una linea, el color de la linea deberia corresponder al color azul" do
        @ln.dibujar("#0000ff")
        expect(@ln.obtenerColor()).to eq "#0000ff"
    end

    it "cuando el jugador 2 dibuja una linea, el color de la linea deberia corresponder al color rojo" do
        @ln.dibujar("#ff0000")
        expect(@ln.obtenerColor()).to eq "#ff0000"
    end

end
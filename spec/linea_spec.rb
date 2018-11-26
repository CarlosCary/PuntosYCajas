require "./lib/linea"
describe Linea do

    before(:each) do
        @ln=Linea.new()
    end

    it "la linea no deberia estar dibujada cuando es creada" do
        expect(@ln.lineaEstaDibujada()).to eq false
    end

    
    it "deberia poder dibujar la linea del color rojo" do
        @ln.dibujar("red")
        expect(@ln.lineaEstaDibujada()).to eq true
        expect(@ln.obtenerColor).to eq "red"
    end

    it "la linea deberia ser de color negro inicialmente" do
        expect(@ln.obtenerColor()).to eq "black"
    end

    it "luego de dibujar la linea deberia cambiar de color" do 
        @ln.dibujar("red")
        expect(@ln.obtenerColor()).to eq "red"
    end

    it "cuando el jugador 1 dibuja una linea, el color de la linea deberia corresponder al color 'red'" do
        @ln.dibujar("red")
        expect(@ln.obtenerColor()).to eq "red"
    end

    it "cuando el jugador 2 dibuja una linea, el color de la linea deberia corresponder al color 'blue'" do
        @ln.dibujar("blue")
        expect(@ln.obtenerColor()).to eq "blue"
    end

end
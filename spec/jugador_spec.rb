require "./lib/jugador"
describe Jugador do

    before(:each) do
        @jg=Jugador.new()
    end

    it "el no deberia tener nombre inicialmente" do
        expect(@jg.nombre).to eq ""
    end

    it "el no deberia tener ningun color inicialmente" do
        expect(@jg.color).to eq ""
    end

    it "el jugador deberia tener un puntaje inicial de '0' " do
        expect(@jg.puntaje).to eq 0
    end

    it "cuando le asigno el color 'red' a un jugador debe ser su color para dibujar lineas" do
        @jg.color = "red"
        expect(@jg.color).to eq "red"
    end
    
end
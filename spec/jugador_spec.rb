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
end
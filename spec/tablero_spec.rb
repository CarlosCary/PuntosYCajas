require "./lib/tablero"
describe Tablero do
    before(:each) do
        @tb=Tablero.new()
    end
    it "deberia estar vacia al momento de crearla" do
      expect(@tb.estaVacia()).to eq true
    end
    it "no deberia estar vacia luego de dibujar" do
      @tb.dibujarLinea()
      expect(@tb.estaVacia()).to eq false
    end
end
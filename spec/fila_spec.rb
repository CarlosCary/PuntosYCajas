require "./lib/fila"
describe Fila do
    before(:each) do
        @fl=Fila.new()
    end
    it "deberia estar vacia al momento de crearla" do
      expect(@fl.estaVacia()).to eq true
    end
    it "no deberia estar vacia luego de dibujar" do
      @fl.dibujarLinea()
      expect(@fl.estaVacia()).to eq false
    end
end
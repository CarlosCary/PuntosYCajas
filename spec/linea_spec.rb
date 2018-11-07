require "./lib/linea"
describe Linea do
    before(:each) do
        @ln=Linea.new()
    end
    it "deberia estar vacia al momento de crearla" do
      expect(@ln.estaVacia()).to eq true
    end
    it "no deberia estar vacia luego de dibujar" do
      @ln.dibujarLinea()
      expect(@ln.estaVacia()).to eq false
    end
end
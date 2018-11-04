require "./lib/celda"
describe Celda do
    before(:each) do
        @cd=Celda.new()
    end
    it "deberia estar vacia al momento de crearla" do
      expect(@cd.estaVacia()).to eq true
    end
    it "deberia mostrar una linea arriba al insertarla" do
      @cd.insertarLinea("arriba")
      expect(@cd.tieneLinea("arriba")).to eq true
    end
    it "luego de insertar una linea no deberia estar vacia" do
        @cd.insertarLinea("arriba")
        expect(@cd.estaVacia()).to eq false
    end
    it "luego de insertar lineas en los 4 lados deberia estar completa" do
        @cd.insertarLinea("arriba")
        @cd.insertarLinea("abajo")
        @cd.insertarLinea("izquierda")
        @cd.insertarLinea("derecha")
        expect(@cd.estaCompleta()).to eq true
    end
end
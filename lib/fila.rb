class Fila
    def initialize()
        @vacia=true
    end

    def estaVacia()
        return @vacia
    end

    def dibujarLinea()
        @vacia=false
    end
end
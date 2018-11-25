class Linea
    attr_accessor :color, :dibujado
    
    def initialize()
        @dibujado = false
        @color = "#000000"
    end

    def lineaEstaDibujada()
        return @dibujado
    end

    def dibujar(color)
        @dibujado = true
        @color = color
    end

    def obtenerColor()
        return @color
    end

end
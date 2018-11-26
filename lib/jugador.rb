class Jugador
    attr_accessor :nombre, :color, :puntaje
    def initialize()
        @nombre = ""
        @color = ""
        @puntaje = 0
    end

    def obtenerColor()
        return "background-color:" + @color
    end
end
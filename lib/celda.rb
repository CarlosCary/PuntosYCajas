class Celda

    def initialize()
        @vacia=true
        @completa=false
        @arriba=false
        @abajo=false
        @derecha=false
        @izquierda=false
    end

    def estaVacia()
        return @vacia
    end
    
    def insertarLinea(posicion)
        case posicion
        when "arriba"
            @arriba=true
        when "abajo"
            @abajo=true
        when "derecha"
            @derecha=true
        when "izquierda"
            @izquierda=true
        end
        @vacia=false
    end

    def tieneLinea(posicion)
        case posicion
        when "arriba"
            return @arriba
        when "abajo"
            return @abajo
        when "derecha"
            return @derecha
        when "izquierda"
            return @izquierda
        end
    end

    def estaCompleta()
        if(@arriba=true&&@abajo==true&&@derecha==true&&@izquierda==true)
            @completa=true
        end
        return @completa
    end
end
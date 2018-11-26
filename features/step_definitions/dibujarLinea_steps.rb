Then("se deberia dibujar una linea en esa posicion") do
    page.find('#tablero').first(".caja").has_css?('border-top-color:red')
  end
  
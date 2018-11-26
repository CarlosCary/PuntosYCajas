When("ingresa el numero de caja {string} y la direccion de linea {string}") do |caja, dirLinea|
  page.driver.post('/partidaJugando1?numeroCaja=caja&direccionLinea=dirLinea')
  click_on(id: 'realizarJugada')
end

Then("se deberia dibujar una linea en esa posicion") do
    page.find('#tablero').first(".caja").has_css?('border-top-color:red')
end
  
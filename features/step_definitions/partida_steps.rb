Given("jugador que esta en una partida") do
    visit('/partida')
end
  
  Then("deberia ver el tablero con las jugadas realizadas por todos los jugadores") do
    page.find_by_id("board-container").find_by_id("dotCanvas")
  
  end
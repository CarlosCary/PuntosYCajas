Given("un jugador que inicio una partida") do
    visit('/partida')
end

Then("deberia ver el tablero vacio") do
  page.find_by_id("tablero-juego").assert_no_text("_")
  page.find_by_id("tablero-juego").assert_no_text("|")
end
Given("un jugador que inicio una partida") do
    visit('/partida')
end

Then("deberia ver el tablero vacio") do
  # page.find_by_id("tablero-juego").assert_no_text("_", count:12)
  # page.find_by_id("tablero-juego").assert_no_text("|", count:12)
  # page.assert_none_of_selectors(:custom, '|', '_', visible: none)
  page.assert_all_of_selectors('span.apagado', count: 28)
end

Given("un jugador que esta en medio de una partida") do
  visit('/partidaJugando')
end

Then("deberia ver el tablero con las jugadaras realizadas") do
  page.assert_all_of_selectors('span.azul', count: 1)
end

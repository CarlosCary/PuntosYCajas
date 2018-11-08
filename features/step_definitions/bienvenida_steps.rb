  Given("visito la pagina principal") do
    visit('/')
  end
  
  Then("deberia ver el mensaje {string}") do |mensaje|
    expect(page).to have_content(mensaje)
  end
      
  # When("presiono el boton {string}") do |crear|
  #   click_on(crear)
  # end
  
  # Then("deberia redirigirme a la pagina con la url {string}") do |string|
  #   pending # Write code here that turns the phrase above into concrete actions
  # end
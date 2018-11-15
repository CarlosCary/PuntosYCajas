  Given("visito la pagina principal") do
    visit('/')
  end
  
  Then("deberia ver el mensaje {string}") do |mensaje|
    expect(page).to have_content(mensaje)
  end
      
  When("presiono el boton {string}") do |crear|
     click_on(crear)
  end


  Then("deberia redirigirme a la pagina para {string} ingresar mis configuraciones") do |config|
    page.assert_current_path(config)  
  end
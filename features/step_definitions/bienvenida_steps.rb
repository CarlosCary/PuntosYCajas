  Given("visito la pagina principal") do
    visit('/')
  end
  
  Then("deberia ver el mensaje {string}") do |mensaje|
    expect(page).to have_content(mensaje)
  end
      
  Given("estoy en la pagina principal") do
    visit('/')
  end

  When("presiono el boton {string}") do |crear|
     click_on(crear)
  end

  Then("deberia redirigirse a la pagina {string} para ingresar mis configuraciones") do |config|
    page.assert_current_path(config)  
  end
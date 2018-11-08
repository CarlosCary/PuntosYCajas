require 'sinatra'
class App < Sinatra::Base

    post '/configuracion' do
        erb:configuracion
    end
    get '/partida' do
        erb:partida
    end
    get '/' do
        erb:bienvenida
    end
  
    
    run! if app_file == $0;
end
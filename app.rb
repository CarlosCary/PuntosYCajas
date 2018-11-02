require 'sinatra'
class App < Sinatra::Base
    get '/' do
        erb:bienvenida
    end

    post '/sumar' do
        "Sumar"
    end
    
    run! if app_file == $0;
end
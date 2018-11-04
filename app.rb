require 'sinatra'
class App < Sinatra::Base
    get '/' do
        erb:bienvenida
    end

    post '/jugar' do
        "Jugar"
    end
    
    run! if app_file == $0;
end
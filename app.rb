require 'sinatra'
class App < Sinatra::Base

    get '/' do 
        erb:partida
    end

    get '/partida' do
        erb:partida
    end
    
    run! if app_file == $0;
end
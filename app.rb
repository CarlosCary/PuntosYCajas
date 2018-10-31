require 'sinatra'
class App < Sinatra::Base
get '/' do
    erb:bienvenida
end

post '/sumar' do
    "Sumar"
end
end
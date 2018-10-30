require 'sinatra'
class Test < Sinatra::Base
get '/' do
    erb:bienvenida
end

post '/sumar' do
    "Sumar"
end
end
require 'sinatra'

get '/' do
  "Hello World!"
end

get '/hi' do
  "Sub Hello World!"
end
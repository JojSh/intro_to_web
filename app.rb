require 'sinatra'

get '/' do
  "Not SOMETHING!"
end

get '/secret' do
  "secret stuff"
end

get '/cat' do
  @name = ["Jim", "Cornelius", "Frank"].sample #[rand(3)]
  erb(:index)
end

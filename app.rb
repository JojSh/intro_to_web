require 'sinatra'

get '/' do
  "Not SOMETHING!"
end

get '/secret' do
  "secret stuff"
end

get '/random-cat' do
  @name = ["Jim", "Cornelius", "Frank"].sample #[rand(3)]
  erb(:index)
end

get '/named-cat' do
  p params
  @name = params[:name]
  erb(:index)
end

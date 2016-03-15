require 'sinatra'
require 'shotgun'

set :session_secret, 'super secret'

get '/' do
  erb(:index)
end

get '/cat' do
  @name = ["Amigo", "Oscar", "Viking"].sample
  erb(:cat)
end

get '/secret' do
  "This is a secret"
end

get '/another-route' do
  erb "Hi there, Visitor <%= 2 + 2 %>!"
end

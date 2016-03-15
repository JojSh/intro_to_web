require 'sinatra'
require 'shotgun'

set :session_secret, 'super secret'

# get '/' do
#   @name = params[:name]
#   erb(:index)
# end

get '/' do
  @name = params[:name]
  erb(:cat_form)
end

post '/named-cat' do
  p params
  @name = params[:name]
  erb(:index)
end

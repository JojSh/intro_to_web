require 'sinatra'

get '/' do
  "Not SOMETHING!"
end

get '/secret' do
  "secret stuff"
end

get '/cat' do

  "<marquee direction='down' style='border: 3px dashed red'><img src='http://bit.ly/1eze8aE'/></marquee>"

end

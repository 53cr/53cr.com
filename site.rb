begin
require 'rubygems'
rescue LoadError
end
require 'sinatra'

get '/' do
  haml :home
end

get '/services' do
  haml :services
end

get '/contact' do
  haml :contact
end

post '/contact' do
  # send mail
end

get '/portfolio' do
  haml :portfolio
end

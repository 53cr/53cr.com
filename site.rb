begin
require 'rubygems'
rescue LoadError
end
require 'sinatra'

helpers do

  def path_is(path)
    request.env["REQUEST_URI"].slice(0,path.size) == path
  end
  
end

get '/sass/:stylesheet.css' do
  header 'Content-Type' => 'text/css; charset=utf-8'
  sass params[:stylesheet].to_sym
end

get '/' do
  title = 'Home'
  header = "My Header"
  haml :home, :locals => {:title => title, :header => header}
end

get '/contact' do
  title = "Contact Us"
  header = "Contact"
  haml :contact, :locals => {:title => title, :header => header}
end

post '/contact' do
  # send mail
end

get '/portfolio' do
  title = "Portfolio"
  header =" Portfolio"
  haml :portfolio, :locals => {:title => title, :header => header}
end

begin
require 'rubygems'
rescue LoadError
end
require 'sinatra'

helpers do

  def path_is(path)
    actual_path = request.env["REQUEST_URI"]
    (return false unless actual_path == path) if path == '/'
    return actual_path.slice(0,path.size) == path
  end
  
  def link_to(text,url)
    "<a href='#{url}'>#{text}</a>"
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

# blog index
get '/blog' do
  "BLOG!"
end

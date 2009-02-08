$LOAD_PATH << File.join(File.dirname(__FILE__),'lib')
begin
require 'rubygems'
rescue LoadError
end
require 'sinatra'
require '53cr_helpers'

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
  title = "Isotopical"
  header = "Isotopical"
  haml :blog_index, :locals => {:title => title, :header => header}
end

get '/blog/:slug' do
  title = "Isotopical"
  header = "Blog!"
  blog_content = haml params[:slug].to_sym, :layout => false
  haml :blog, :locals => {:title => title, :header => header, :blog_content => blog_content}
end

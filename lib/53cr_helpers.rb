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

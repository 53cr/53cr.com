require 'yaml'

module ViewHelper

  def post_summary(post, chars)

    text = render(post)
    text.gsub!(/<\/?[^>]*>/m, "")
    short_text = text[0..chars]
    
    if short_text.size < text.size
      short_text.sub!(/\s+\S+$/m,'...')
    end
    short_text

  end

  def tag_list
    tags = YAML.load_file('tmp/tags.yml')
    ret = {}
    tags.each do |k,v|
      ret.merge!({k => v.size})
    end
    return ret
  end

  def month_to_name(num)
    months = %w{January February March April May June July August September October November}
    return months[num.to_i-1]
  end
  
  def date_list
    dates = YAML.load_file('tmp/dates.yml')
    dates
  end

  def image_tag(path, alt)
    "<img src='#{path}' alt=\"#{alt}\">"
  end 
  
  def blog_image(image, options)
    alt = options.delete(:alt) || image
    caption = options.delete(:caption)
    float = options.delete(:float) || "none"

    div = "<div class='blog_image' style='float:#{float}'>" +
      "<img src='#{image}' alt='#{alt}'>"
    if caption
      div << "<br><p class='caption'>#{caption}</p>"
    end
    div << "</div>"
    div
  end


end

Webby::Helpers.register(ViewHelper)

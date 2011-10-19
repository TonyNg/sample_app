module ApplicationHelper

  # Return a title on a per-page basis.
  def title
    base_title = "Ruby on Rails Tutorial Sample App"
    if @title.nil?
      base_title
    else
      "#{base_title} | #{@title}"
    end
  end
  
   def logo
    image_tag("logo.png", :alt => "PolyWho", :class => "round")
  end
  
  def javascript(*args)
  content_for(:head) { javascript_include_tag(*args) }
  end
  
end
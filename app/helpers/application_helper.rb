# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def primary (text, url)
    return "<input type='submit' class='primary' value='#{text}' onClick='window.location=\"#{url}\"'>"
  end
  
  # This overrides link_to!
  def link_to(*args,&block)
    if block_given?
      concat(super(capture(&block), *args), block.binding)
    else
      super(*args)
    end
  end
       
  def select_link(url, html_options, selected = nil)
    "<select class='link' href='#{url}'>" << options_for_select(html_options, selected ) << "</select>"
  end
  
  # Used in RJS templates.. Wow, it just works!
  # Alternatively, I could have a method that just adds a message straight to the page, instead of having the page remember to add a placholder for it. 
  # If we determine it should be in the same place, regardless of where the form is, this could work
  # However, for comments, it would mess it up, since we are at the very bottom of the page
  def message (message)
    page.replace_html 'results', message
    page.visual_effect :highlight, 'results'
  end
end

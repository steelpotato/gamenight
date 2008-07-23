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
  
end

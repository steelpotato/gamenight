# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def primary (text, url)
    return "<input type='submit' class='primary' value='#{text}' onClick='window.location=\"#{url}\"'>"
  end
end

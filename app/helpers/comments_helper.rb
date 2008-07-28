module CommentsHelper

  def insert_comment (comment)
    # Notice how this uses a partial to insert the html
    page.insert_html :bottom, 'comments', :partial => 'games/comment', :locals => { :c => comment }
    
    # Woot
    page.visual_effect :blind_down, comment.id.to_s + "_comment"
  end
end

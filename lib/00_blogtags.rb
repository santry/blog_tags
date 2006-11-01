Behavior::Base.define_tags do
  
  tag "next" do |tag|
    current = tag.locals.page
    by = tag.attr['by'] || 'title'
    
    # get the page's siblings, exclude any that have nil 
    # for the sorting attribute, exclude virtual pages,
    # and sort by the chosen attribute
    siblings = current.self_and_siblings.delete_if { |s| s.send(by).nil? || s.virtual? }.sort_by { |page| page.attributes[by] }
    index = siblings.index(current)
    next_page = siblings[index + 1]
  
    if next_page
      tag.locals.page = next_page
      tag.expand
    end
  end

  tag "previous" do |tag|
    current = tag.locals.page
    by = tag.attr['by'] || 'title'
    siblings = current.self_and_siblings.delete_if { |s| s.send(by).nil? || s.virtual? }.sort_by { |page| page.attributes[by] }
    index = siblings.index(current)

    # we don't want to wrap around to the last article    
    if index > 0 then previous = siblings[index - 1] 
    else previous = nil; end
    
    if previous
      tag.locals.page = previous
      tag.expand
    end
  end
  
  tag "time_ago_in_words" do |tag|
    ActionView::Base.new.time_ago_in_words(tag.locals.page.published_at || tag.locals.page.created_at)
  end
  
    
end
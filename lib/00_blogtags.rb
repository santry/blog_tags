Behavior::Base.define_tags do
  
  tag "next" do |tag|
    current = tag.locals.page
    by = tag.attr['by'] || 'title'
    siblings = current.self_and_siblings.sort_by { |page| page.attributes[by] }
    index = siblings.index(current)
    next_page = siblings.fetch(index += 1, siblings[0])
    while !(next_page.nil?) and next_page.behavior_id =~ /Archive/
      next_page = siblings.fetch(index += 1, siblings[0]) 
    end
    
    if next_page
      tag.locals.page = next_page
      tag.expand
    end
  end

  tag "previous" do |tag|
    current = tag.locals.page
    by = tag.attr['by'] || 'title'
    siblings = current.self_and_siblings.sort_by { |page| page.attributes[by] }
    index = siblings.index(current)
    previous = siblings.fetch(index -= 1, nil)    
    while !(previous.nil?) and previous.behavior_id =~ /Archive/
      previous = siblings.fetch(index -= 1, nil)
    end
    
    if previous
      tag.locals.page = previous
      tag.expand
    end
  end
  
  tag "time_ago_in_words" do |tag|
    ActionView::Base.new.time_ago_in_words(tag.locals.page.published_at || tag.locals.page.created_at)
  end
  
    
end
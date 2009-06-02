class BlogTagsExtension < Radiant::Extension
  version "0.1"
  description "Provides some useful blogging tags, like next and previous and time_ago_in_words"
  url "http://github.com/santry/blog_tags/"
  
  def activate
    Page.send :include, BlogTags
  end
end
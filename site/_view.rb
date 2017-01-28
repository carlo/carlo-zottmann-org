extend_view do

  def blog_posts
    find('/posts').latest_posts.reject(&:draft?)
  end


  def page_title
    page.data["title"] ?
      "#{page.data["title"]} &middot; #{config["site_title"]}" :
      config["site_title"]
  end


  def config
    config_node.data
  end


  def config_node
    @config_node ||= find("/_config")
  end

end

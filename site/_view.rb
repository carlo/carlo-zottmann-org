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


  def nodes_for_sitemap
    public_pages = []
    TreeWalker.walk_tree(find('/')) do |node|
      public_pages << OpenStruct.new({
        url: node.url,
        title: node.title,
        date: node.data.date,
      } )if node.page? && node.should_publish?
    end

    public_pages
  end

end

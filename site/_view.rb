extend_view do

  def blog_posts
    find('/posts').latest_posts.reject(&:draft?)
  end


  def page_title
    page.data['title'] ?
      "#{ page.data["title"] } &middot; #{ config["site_title"] }" :
      config['site_title']
  end


  def years_with_posts
    find('/posts').posts.map { |p| p.data.date.year }.uniq.reverse
  end


  def config
    config_node.data
  end


  def config_node
    @config_node ||= find('/_config')
  end


  def nodes_for_sitemap
    TreeWalker.walk_tree(find('/'), []) do |node, results|
      results << node if node.page? && node.should_publish?
      results
    end.compact
  end

end

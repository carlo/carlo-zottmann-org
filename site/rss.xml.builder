xml.instruct!
xml.rss version: "2.0", 'xmlns:atom' => 'http://www.w3.org/2005/Atom' do
  xml.channel do
    xml.title config['site_title']
    xml.description config['site_description']
    xml.link config['site_url']
    xml.language 'en'
    xml.generator "Flutterby #{Flutterby::VERSION}"
    xml.tag! 'atom:link', href: "#{ config['site_url'] }/rss.xml", rel: 'self', type: 'application/rss+xml'

    for post in blog_posts.first(10)
      xml.item do
        xml.title post.title
        xml.author config['author']
        xml.pubDate post.date.to_time.rfc822
        url = config['site_url'] + post.url
        xml.link url
        xml.guid url, isPermaLink: true

        xml.description post.render
      end
    end
  end
end

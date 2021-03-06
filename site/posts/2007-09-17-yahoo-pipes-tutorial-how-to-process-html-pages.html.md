---
title: "Yahoo! Pipes Tutorial: How To Process HTML Pages"
date: 2007-09-17
---

[![Y! Pipes: HTML processing, thumb][1]][2]Over the weekend I finally had some time to continue playing around with [Yahoo! Pipes][3]. (Turns out that quitting World of Warcraft makes your days longer. Huh. Who'd have thought…)  It really is a neat toy/tool.

Alas, it is not without hitches. If you've worked with Pipes before, you know that it has a [module named 'Fetch Data'][4], but unfortunately this module is only able to deal with XML and JSON data. It's just that it will outright reject anything else. And most HTML pages fall in this category.

Here's my story on how I managed to make Pipes process run-of-the-mill HTML pages. I couldn't find anything on this topic on the net, so even though I don't think I am the first guy to tackle this problem, I want to share what I found out.

A little background. I wanted to build a comic feed for [Explosm.net's Cyanide & Happiness][5], a comic strip for the …wicked. C&H has an official RSS feed, but it only carries links to the new comic pages. Which is fine and dandy for most people, but _I am a busy guy_, you know, what with my hectic web-3.1 lifestyle and all, and I really can't afford to even lose 20 seconds by clicking through _to anywhere_. (Read: I'm really lazy.)

So I tried to make Pipes to parse the Explosm.net comic pages and produce a Pipes-powered feed that not only had the link, but also the particular comic image for that day.

I started out with the [Fetch Feed module][6] reading the [Explosm.net RSS feed][7]. I am usually not interested in anything but the comics, so in a second step, I made use of the [Filter module][8] to ditch feed items that doesn't contain the word "comic".

So that left me with a list of feed items, each with a link, a description, a title and some other metadata.

That's where the trouble started. Boy, what was I thinking?! The HTML pages are far from perfect, they sure as hell doesn't validate as XML. Then again — that's alright! The site wasn't made for scraping or parsing, it was made to display -tasteful- weird comic strips, and that's enough. I like it for that.  It's just that there is no Pipes module to grab a glob of textual data and work with it. (Yet? Please, someone say "Yet", employing a knowing undertone.)

After a while of trying to beat any of the available ['Fetch *' modules][9] into submission, I was close to giving up. But then I remember I had come across a [HTML Tidy][10] service a few months or years ago. After a few minutes, I had rediscovered it: [W3C's own Tidy service][11]. It'll digest any HTML page (you just pass the address), and it will clean it up and return valid a XHTML document, which also constitutes as XML. Huzzah!

Well then, commence plumbing! The third module I used was the wonderful [Loop module][12]. It's special because it will process every item in a given dataset, in this case it'd iterate over all remaining feed items. I've told the [Loop module][12] to use the [String Builder module][13], there I concatenated the Tidy URL, [`http://cgi.w3.org/cgi-bin/tidy?forceXML=on&docAddr=`][14], with the `item.link` attribute, and assigned the resulting string to a new a attribute, `item.link_tidy`.

Step four consisted of another [Loop][12], in which I would use a [Fetch Data module][4] to grab the data from the Tidy'd Explosm.net pages, which had now been transformed into neat and valid XML structures and therefore could be digested by the module. It took me a few minutes to find the exact location of the image element (`body.div.table.tr.td.div.0.div.1.table.tr.td.1.div.font.0.content`), which I then stored in a new attribute named `item.content`.

_(While we're at it, in the future I would very much like to have the option to use XPath addressing in 'Fetch Data'… or any related module, for that matter. Thanks in advance. :) )_

Anyways, the next steps are using yet another [Loop][12] to concatenate the image HTML with the original `item.description`, and then _another_ one to rewrite the original image URLs a bit so the images are served through the free and excellent [Coral Distribution Network][15].

_(Technically, I might not be stealing from Explosm.net, especially since they allow hotlinking of their comic strips from message boards and pretty much anywhere, but for the sake of this example and story here, and the assumption that a few people might end up cloning the Pipe — yes, I am a dreamer —, I feel a bit better knowing I leave less of a footprint on their image servers.)_

Then it was applying a [Reverse module][16] to flip the order of the items (a cosmetical issue), and that was it.

So, to sum up this long and rather tedious story: you _can_ process HTML pages with Yahoo! Pipes. It's just not as straightforward as you would expect.

Well, and if you want to take a look at it: here's [the finished Pipe][17] — it might not look like much since the HTML preview doesn't show the images, but the [RSS output][18] is complete.

Tip o' the hat to [Cyanide & Happiness][5] for mindblowing hijinx, the [W3C][19] for the free & open Tidy service, and the [CDN][15] for being good people.

Now go and use [Yahoo! Pipes][3]. It's one of the cooler products we (as a company) have released in the last few years, and quite frankly, it deserves praise.

So there.

Quick links: [Finished Pipe][17], [RSS Output][18]

Update, 2007-09-19:* I've slightly adjusted the element addressing in the Pipe to waterproof it a bit. The general idea and order of the modules didn't change, tho.

**Update, 2007-12-07:** My technique has been superceded by the offical new [Fetch Page module][20] — enjoy! :)

[1]: //dl.dropbox.com/u/7298/blog/wp-content/2007/09/pipes_explosm_example_thumb.jpg
[2]: //dl.dropbox.com/u/7298/blog/wp-content/2007/09/pipes_explosm_example.png (Y! Pipes: HTML processing, Explosm.net Example. The link to the Y! Pipes page is at the end of the blog entry.)
[3]: http://pipes.yahoo.com/
[4]: http://pipes.yahoo.com/pipes/docs?doc=sources#FetchData
[5]: http://explosm.net/
[6]: http://pipes.yahoo.com/pipes/docs?doc=sources#FetchFeed
[7]: http://feeds.feedburner.com/Explosm
[8]: http://pipes.yahoo.com/pipes/docs?doc=operators#Filter
[9]: http://pipes.yahoo.com/pipes/docs?doc=sources
[10]: http://en.wikipedia.org/wiki/HTML_Tidy
[11]: http://cgi.w3.org/cgi-bin/tidy
[12]: http://pipes.yahoo.com/pipes/docs?doc=operators#Loop
[13]: http://pipes.yahoo.com/pipes/docs?doc=string#StringBuilder
[14]: http://cgi.w3.org/cgi-bin/tidy?forceXML=on&docAddr=
[15]: http://coralcdn.org/
[16]: http://pipes.yahoo.com/pipes/docs?doc=operators#Reverse
[17]: http://pipes.yahoo.com/pipes/pipe.info?_id=Om0bps5i3BGKQJR0l7okhQ
[18]: http://pipes.yahoo.com/pipes/pipe.run?_id=Om0bps5i3BGKQJR0l7okhQ&_render=rss
[19]: http://w3.org
[20]: http://blog.pipes.yahoo.com/2007/12/06/new-fetch-page-module-and-nice-web-path-enhancement/


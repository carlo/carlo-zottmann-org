---
title: "The Big Blog Move Of 2012, Part 2"
date: 2012-06-05
---

<summary><strong>The Saga continues, or: Goodbye Calepin, hello Jekyll.</strong></summary>

A few weeks ago [word got around][post-calepin-closing] that Calepin, the Dropbox-based blog service I used, was going to close soon.

Luckily, all my posts were plain text files on my Mac already (well, Markdown files), so I was much calmer this time around as I knew it wouldn't mean as [much work as last time][post-blog-move].

Still, it meant I'd have to move yet _again_, and after looking around without finding anything that suited me[^1], I hunkered down and tried to come up with a setup that wouldn't annoy me (much).  After a few minutes I decided to go with [jekyll][jekyll], _"a simple, blog aware, static site generator"_, as the site says.  Eats Markdown files, poops out static HTML pages, works for me.[^2]

Of course, moving from a site like Calepin means having to start over with the entire design; back when I moved to Calepin I had felt happy about not having to make any design choices, and I was fond of its minimalist approach -- no fluff, just text, I liked that.  I would stick with that idea.

As I am lacking any skill when it comes to original design I tried to find out what I liked about the look of some other blogs I read.  **So I drew a good amount of inspiration from these sites and apps**:

- [Dustin Curtis][dcurtis]: I really liked the rather minimalist, fixed left column.
- Both [Instapaper's iOS app][instapaper] & [Dustin Curtis][dcurtis] (again) made me realize I love [Proxima Nova][font-proxima-nova] -- what a beautiful font.
- [Robin Sloan][robin-sloan]: It was his site where I found my headline font, [Le Monde Courrier STD][font-le-monde].  Also, I like the highlighting he is using in some of his posts, as well as the formatting of the post dates.

Thank you, guys!  :)

Then I came across [Oliver Reichenstein's rather good iA post, "Sweep the Sleaze"][ia-sharing], which made me think about all those damn social buttons.  Initially I had considered adding some bare-bones sharing mechanisms to the site, but that article gave me pause.  Those things are everywhere, but how often had I actually used them?  Not very often -- my Twitter client is open anyways, and I guess yours is, too.  So _if_ you want to share something you read here[^3], you'd probably know how to do it anyways, and very likely have your favourite tools at hand, to boot.  <span class="highlight">Rule of thumb: If you can't be bothered to copy and paste a link, chances are high it's not that important/hilarious/awe-inspiring anyways.</span>  And frankly, not _everything_ I say or write will make you want to wring your hat in your hands, gasping with amazement.  Yes, yes, no, don't say it -- I know it's true.  So there.

Also, after taking a peek at my logs I noticed almost no visitor cared about my tag pages or categories, so I did away with those as well.  Thus, there's only post pages like this one and [overview pages][index].

**In terms of CSS**, I've decided to use [Skeleton][skeleton] as the foundation, which is a minimal set of CSS rules for **responsive design** -- meaning the site will look good on a big desktop monitor as well as on an iPhone screen.

HTML-wise, I looted some ideas from my friend Mike's site, among them his rather clever use of microformats -- the `address` tag implementation on [mikewest.org][mikewest] made me nod very, very approvingly.[^4]  Thanks, Mike!

**The fonts are served by Typekit and Fontdeck.**  Why not just one of them?  Well, funny story.  I signed up for Typekit's $25/yr ["Personal Plan"][typekit-plans] -- and only then I realized my beloved Proxima Nova wasn't available in that plan.  Of course, upgrading to the $50/yr "Portfolio Plan" would give me access, but well, fuck that.  [Fontdeck][fontdeck]'s _"pay as you go"_ idea made more sense in that situation, as I could purchase/rent Proxima Nova for a mere $10/yr.  So that's what I did.  Of course Fontdeck doesn't offer the Le Monde fonts, so that's where Typekit comes in.  It's all a bit weird, really.

**To the server, then!**  Ah yes, but a few weeks ago I had cancelled pretty much all my old personal server hosting, and hadn't gotten around to look for a new one.  But you know who's good at hosting?  [Heroku][heroku]!  [Their pricing][heroku-pricing] starts at "free", and I figured said free level would have plenty juice to serve a static site.  [16 lines of code later][gist-heroku] I knew I was right.

So, that's it.

It's working, and I'm reasonably proud of my wee blog.  I still want something Dropbox-based, and in a way, I already have parts of it.  My "raw" post files reside in a Dropbox folder, but to publish them I have to hit the terminal, which is a bit of a downer.  There's a high chance I might end up doing something about this at some point in the future.  We'll see.

But maybe I'll write some blog posts first.

<span class="highlight">If you want to comment, allow me to direct your attention to the intentionally absent comment form below, and then to the links in the sidebar.  If you want to, you know how to reach me.</span>


[^1]: Sorry, [Scriptogr.am][scriptogram] -- you're pretty and appealing, but your lack of custom routes/slugs would mean all my old blog post URLs would 404, and I can't have that.

[^2]: One big downside of Jekyll: the concept of "drafts" is foreign to it.  Luckily, I found [a super-easy way around that][gist-jekyll-drafts].

[^3]: Haha, yeah… I know.  ;)

[^4]: Pictured: Approving nods.  
![Pictured: Approving nods.](//czm.io/a/nod.gif)


[dcurtis]: http://dcurt.is
[font-le-monde]: https://typekit.com/fonts/le-monde-courrier-std
[font-proxima-nova]: http://fontdeck.com/font/proximanova/regular
[fontdeck]: http://fontdeck.com/
[gist-heroku]: https://gist.github.com/15666dac3cf4b5b2f8c4
[gist-jekyll-drafts]: https://gist.github.com/2870636
[heroku-pricing]: http://www.heroku.com/pricing
[heroku]: http://heroku.com/
[ia-sharing]: http://informationarchitects.net/blog/sweep-the-sleaze/
[index]: /
[instapaper]: http://www.instapaper.com/iphone
[jekyll]: http://jekyllrb.com
[mikewest]: http://mikewest.org
[nod.gif]: //dl.dropbox.com/u/7298/images/nod.gif
[post-blog-move]: /2012/01/20/the-big-blog-move-of-2012/ "The big blog move of 2012 (part 1)"
[post-calepin-closing]: /2012/04/21/post-it-29/ "Post-It #29"
[robin-sloan]: http://www.robinsloan.com/about/
[scriptogram]: http://scriptogr.am
[skeleton]: http://getskeleton.com/
[typekit-plans]: https://typekit.com/plans

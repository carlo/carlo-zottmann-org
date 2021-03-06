---
title: "Social whitelisting with OpenID, my take"
date: 2007-01-23
---

When I read [Simon’s proposal about social whitelisting with OpenID][1] this morning, I was immediately intrigued by the idea. Basically, he’s suggesting that by whitelisting trusted OpenIDs, sharing these lists among peers, and using them to decide whether to place a new comment on your own blog in a moderation queue or not, a group of people could build a working, trust-based protection against comment spam(mers).

Go read. It’s good stuff. I’ll wait.

[…]

Welcome back.

Now, I was pondering this while walking home from the bus. Mainly, I was thinking how to make this approach technically feasible. I doubt anyone would be willing to manually collect all the whitelists of his peers by hand. Well,
at least _I_ wouldn’t be. So, a polling mechanism would be needed.

Let’s say you have a cronjob gizmo that polls your peers’ whitelists once a day. I think in order to end up with a working implementation that doesn’t require much work or time once built, we’d need to come up with a standardized URL scheme. This would allow for simple inclusion of new trusted sources. For example, my whitelist would be accessible under
`[http://carlo.zottmann.org/trust/whitelist/][2]` (example, my OpenID is
`carlo.zottmann.org`, but the URL is not working right now). Yours would be stored at `http://[OpenID]/trust/whitelist/`.

Now if I decide to trust another netizen’s judgement when it comes to other people, I’d simply add her/his OpenID (for example,
`[http://my.open.id.omg/][3]`) to my imaginary polling mechanism, which would know where to look for the whitelist—at `http://[OpenID]/trust/whitelist/`, in our case that’d mean `[http://my.open.id.omg/trust/whitelist/][4]`.

Of course this implies that you have added [OpenID delegation][5] to your blog/site. Now if you move to another ID provider, you’d simply adjust the delegation, your ID would stay the same. As would the whitelist URL. You could even place on another machine, as long as the URL remains the same—`http://[OpenID]/trust/whitelist/`.

Now, when you decide I’m totally out of my mind after making a few bad choices about who to include in my whitelist, you’d simply “unsubscribe” from my whitelist, and that’d be it. On the next caching run our imaginary mechanism would weed out my list of trusted OpenIDs.

Another idea would be something like feed autodiscovery, but for whitelists,
although I’m not so sure about that. This would probably allow for more flexible implementation; then again I don’t find the idea of adding the line
`&amp;amp;lt;link rel="alternate" type="text/plain"
href="http://carlo.zottmann.org/trust/whitelist/"/&amp;amp;gt;` (example) to my header each and every time I decide to try a new Wordpress theme appealing.
(Maybe I should switch to another blogging engine, but yeah… you know how it is.) A simple standardized URL would be, well, simpler. Of course that’s a personal opinion. **Update:** Mike is absolutely right (see comments), it’s silly to mention delegation while turning down the idea of whitelist autodiscovery. I somehow still prefer the notion of having a default location.

Well, it’s just an idea. I’m probably not the first to think about it, but as I’ve said, I promised myself I’d write about those things this year, instead of just mumbling inaudible while riding the bus home.

Opinions?

[1]: http://simonwillison.net/2007/Jan/22/whitelisting/
[2]: http://carlo.zottmann.org/trust/whitelist/
[3]: http://my.open.id.omg/
[4]: http://my.open.id.omg/trust/whitelist/
[5]: http://www.intertwingly.net/blog/2007/01/03/OpenID-for-non-SuperUsers


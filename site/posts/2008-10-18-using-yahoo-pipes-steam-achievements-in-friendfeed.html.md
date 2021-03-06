---
title: "Using Yahoo! Pipes: Steam Achievements in Friendfeed"
date: 2008-10-18
---

During the last few weeks, I've built a couple of pipes I want to share.
("Pipe", in this context, means an application built in [Yahoo! Pipes][1].)

![][2] Here's one of them.

### Steam Achievements

A few weeks ago, I've first tested and then bought the excellent [CrossOver Games][3]. It's an emulator (basically a highly specialized version of
[WINE][4]) which allows me to play a slate of Windows games, old and new,
under OSX. So, that's how I've spent big chunks of my spare time during the last few weeks: playing through the wonderful Portal and the great Half-Life 2 games. (On a related note, I've noticed the [World of Goo demo][5] is running _flawlessly_ in CXG. Awesome!)

I've got the games via [Steam][6], and was both delighted and highly annoyed to learn that newer Steam games offer achievements. You see, I am a sucker for achievements. I love them, even though they aren't good for anything. I usually spend too much time trying to get this or that achievement. These meaningless little pixel badges are "awarded" for different things you manage to do in different games. You can get achievements in various games, on various platforms. For example on [Xbox Live][7], or, as mentioned, on Steam.

So, being a male gamer in his mid-30s, I naturally like to use these superfluous thingies to brag about my mediocre gaming skills. Meaning, I want them to show up on [my Friendfeed profile][8].

Thus, I wrote a pipe which grabs the achievements from any (public) Steam ID page ([here's mine][9]), spitting them out in an usable format -- in Friendfeed's case, that'd be RSS. (Pipes also returns the data as JSON if you want, or even as a handy HTML badge you can put on your blog or whereever.)

I've then added the RSS URL of the finished pipe as new service (type:
"Blog" [^1]) to Friendfeed.

So, that's all there is to it. Maybe I am the only one caring about this type of thing, maybe not. If you have questions or suggestions, sound off in the comments. :)

* Yahoo! Pipes: [Steam Achievements][11]
* Friendfeed: [the result -- my Steam achievements as added service.][12]


[^1]: Friendfeed's terminology is a bit misleading here… If you want to add an RSS feed, you'll _have_ to use "Blog" as new service. Eh.


[1]: http://pipes.yahoo.com
[2]: //dl.dropbox.com/u/7298/blog/wp-content/2007/02/logo-lg.gif (Yahoo! Pipes logo)
[3]: http://www.codeweavers.com/products/cxgames/
[4]: http://www.winehq.org/
[5]: http://store.steampowered.com/app/22010/
[6]: http://store.steampowered.com/about/
[7]: http://live.xbox.com/member/KneelBeforeZott
[8]: http://friendfeed.com/carlo
[9]: http://steamcommunity.com/id/KneelBeforeZott
[11]: http://pipes.yahoo.com/czottmann/steam_achievements
[12]: http://friendfeed.com/carlo?service=feed&serviceid=ef794091147b40adb6b3f3ff76498a14


---
title: "Dev Env acting up when trying to do bulk operations"
date: 2009-10-18
---

(What a title…) I was pulling my hair out over the last two days when I was implementing bulk operations in a project of mine.

In this case, the list of operations to do in bulk is compiled in the browser,
and then the single requests are sent one by one to the server as single AJAX requests. (Think "mark this as read" functionality.)

My problem was that the first and second call in the bulk list usually went through well, but the rest of the calls just ran against a wall since all of a sudden Rails had problems finding the either logged in user or was missing certain methods and/or attributes. Highly annoying as well as completely erratic, as I was sure my code was okay in the first place.

When trying the same operations on a one-by-one basis, all was good. No issues whatsoever.

So while trying to figure out what the fuck was going on, I've played around with different ways to get the current user, checking for the availability of its methods and so on, all to no avail.

At one point I've disabled the `protect_from_forgery` call, and one or two different errors started to appear:

> `A copy of ApplicationController has been removed from the module tree but is still active`

That was new. So I've started digging around for an answer, and found it in an old [Ruby Forum thread][1].

Turns out that Rails' development mode was the culprit, as the app's code is reloaded on every request; so when a lot of concurrent calls are made, the code might reload slower than the calls are coming in and hijinks ensues.

The overly simple solution to this problem? In
`/config/environments/development.rb`, I just set `config.cache_classes` to
`true`, meaning the code isn't reloaded all the time — and as it turns out, my code runs just fine after all! Happy happy joy joy.

The downside is that I'll have to restart my dev server every time I make a code change, but in this particular case, that's not a big deal.

[1]: http://www.ruby-forum.com/topic/153066


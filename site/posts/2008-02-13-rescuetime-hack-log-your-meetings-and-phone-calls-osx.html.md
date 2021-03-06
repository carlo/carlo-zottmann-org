---
title: "RescueTime Hack: Log your meetings and phone calls (OSX only)"
date: 2008-02-13
---

Over the last week I’ve been using [RescueTime][1]. It’s a neat little service that’s keeping track of what you are doing all day long on your machine (Mac or PC) by logging which applications are having the focus. On the site you can then tag the different applications with different keywords (for example, my Mail.app times are tagged with “work”, “communications” and “email”).

And, to make it actually useful, you can analyse your time spent, graphs and all! Check the [product tour on RescueTime.com][2] for more infos and some screenshots. It’s pretty neat. (Yes, privacy concerns, blah blah blah. It’s not the topic of this article, so please keep it to yourself for the moment.
Thanks. :])

So far so good.

My problem, tho, is that I spend quite a bit of time both on the phone and in meetings. Naturally, RT won’t track these times, since these are basically off-screen activities. Uncool.

So after digging around in the RT log files I was amazed to learn they’re just
[YAML][3] files. Eeeeexcellent. I can work with that!

But I wanted something with a GUI, something a bit “cooler” than just a Ruby script. So I took this as opportunity to get a bit into Applescript.
Unfortunately, RescueTime’s Mac doodad doesn’t offer an Applescript API, and I had to improvise.

After two hours of playing around and cursing at Applescript’s syntax (they’re all on crack…), I had something sufficiently cool to show for.

![RescueTime Log Time.app screenshot][4]

So, what is it? It’s a little application that you run everytime you want to log some off-screen time. Basically, it’s just a dialog that allows you to enter a number (i.e. minutes spent), and has some buttons to either log these minutes as “was on the phone” or “was in a meeting”. If you hit “Cancel”, it won’t do anything. (Surprise.)

Let’s say I’ve just spent 15 minutes on the phone, I’ll run the application,
enter “15” and hit the Return key—and the last 15 minutes will be logged as phone call in RT. The app will quit once that’s done. Another meeting, another phone call? Rinse, repeat.

Data-wise, it’ll then create a new file in the right format in RescueTime’s log directory (`~/Library/RescueTime/Logs/Pending/`). On the next data upload RT will pick up the new file, and it’ll appear in your stats as _“manual_phonecall”_. Your meetings will appear as _“manual_meeting”_.

Please note: **Neither existing RescueTime files nor the RescueTime application will be touched or tinkered with.**

Below you’ll find two downloads. The first one is the actual script in plain text. The second is the script compiled as application bundle. If you’re unsure which to pick, you’ll most likely want the latter. ;)

* [RescueTime Log Time.applescript][5]
* [RescueTime Log Time application (ZIP file)][6]

Have fun.

DISCLAIMER: I’ll take no responsibility for loss of data, hair or life. I am very, very sure there won’t be any losses, but still. It works for me, and I’m sharing. Use at your own risk.

[1]: http://rescuetime.com/
[2]: http://www.rescuetime.com/product_tour
[3]: http://yaml.org/
[4]: //dl.dropbox.com/u/7298/blog/wp-content/2008/02/picture-1.png
[5]: //dl.dropbox.com/u/7298/blog/wp-content/2008/02/rescuetime-log-time.applescript (RescueTime Log Time.applescript)
[6]: //dl.dropbox.com/u/7298/blog/wp-content/2008/02/rescuetime-log-time.zip (RescueTime Log Time.app)


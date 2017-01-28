---
title: "Using Keyboard Maestro to bookmark Chrome URLs in Evernote"
date: 2015-05-31
---

<summary><strong>Replacing the Evernote Web Clipper Chrome extension with a Keyboard Maestro macro for better bookmarking: with searchable full-text content and full-size screenshots.</strong></summary>

I like [Evernote](https://evernote.com) a lot. It's my external memory — I put everything in there, from quick notes to directions to recipes to trip planning to bookmarks.  Since I am a heavy Google Chrome user, I am/was using the [Evernote Web Clipper](https://evernote.com/webclipper/) extension, Evernote's official solution to _"Collect the best of the web, all in one place. Quickly and easily clip articles, text, and images right into Evernote."_

Unfortunately, up until a few weeks ago, the extension would only function by injecting `iframe`s and scripts into each page I would visit, on the off chance that I might use the Web Clipper on that particular page.  This —for me— posed several issues.  For one, being a frontend developer I have Chrome's web inspector open pretty much all the time, and every now and then the extension would log errors that would show up in the console, throwing me off.  Irritating, to say the least, especially when I was in the middle of a heavy debugging session.

I'll spare you the rest of my other niggles with the addon.  Don't get me wrong here, it is both usable and useful, and certainly a boon to most people, but some of its facets *I* just did not like.  For example, the Web Clipper is storing the clip/bookmark on the EN server, from where it would then later sync to my local client.  While I understand the technical reasons for this, I think that's backwards — when I take a note I want to see it _without_ the need to sync first.

Also, even though I was employing it heavily, the only thing I really used it for was for bookmarking pages.  I do not have a need for its other features, like cutting pieces of an article or making it more readable or taking screenshots.

Hence, I decided to replace the Evernote Web Clipper with a [Keyboard Maestro](http://www.keyboardmaestro.com/) macro.  (If you have no idea yet as to what KM is, check out the link.  I'll wait.)


## What the macro does

Once triggered, the macro will get URL, title, meta description and a _very_ simple text excerpt from the current page in the browser.  Also, a screenshot of the browser window is captured.

Then, it'll use these bits to compose a formatted (HTML) note in Evernote.

And to top it all off, it'll display a notification, using either the excellent [terminal-notifier](https://github.com/alloy/terminal-notifier) (when installed) or KM's default notification action.

Bonus: if `terminal-notifier` was found and used, clicking the notification will open Evernote.

The note is stored locally first, and then synchronized to the remote Evernote server.


## What to expect from it

This is what a bookmark made with the Evernote Web Clipper looks like in Evernote ([bigger version](https://czm.io/blog-assets/2015-05-screenshot-bookmark-web-clipper.jpg)).  The image is the first image the Clipper found on the page (I'm just guessing here):

![Screenshot of a bookmark made using the Evernote Web Clipper][fig_1]

[fig_1]: https://czm.io/blog-assets/2015-05-screenshot-bookmark-web-clipper.thumb.jpg "Screenshot of a bookmark made using the Evernote Web Clipper"

This is what a bookmark made with the macro looks like in Evernote ([bigger version](https://czm.io/blog-assets/2015-05-screenshot-bookmark-km-macro.jpg)).  The looks can be customized by reworking the HTML string in the AppleScript block:

![Screenshot of a bookmark made using the KM macro][fig_2]

[fig_2]: https://czm.io/blog-assets/2015-05-screenshot-bookmark-km-macro.thumb.jpg "Screenshot of a bookmark made using the KM macro"


## The macro

Download the macro: [km-bookmark-to-evernote.kmmacros](https://czm.io/blog-assets/2015-05-km-bookmark-to-evernote.kmmacros).

Screenshot ([bigger version](https://czm.io/blog-assets/2015-05-screenshot-km-bookmark-to-evernote.png)):

![Screenshot of the macro][fig_3]

[fig_3]: https://czm.io/blog-assets/2015-05-screenshot-km-bookmark-to-evernote.thumb.jpg "Screenshot of the macro"


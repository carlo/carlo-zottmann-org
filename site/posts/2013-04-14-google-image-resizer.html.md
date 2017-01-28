---
title: "Google's authentication-less, on-the-fly image resizing service"
date: 2013-04-14
---

<summary><strong>Did you know Google runs a free and open image resizing service? I certainly didn't.</strong></summary>

While lazily poking around the Google+ HTML I found an interesting thing: for resizing post images on the fly, G+ uses an open API endpoint.  That might come in handy at some point in the future when prototyping this or that, so jotting down some notes felt like a good idea.

If you know more about this API, let me know, please!  (See the sidebar for options.)

A word of warning before I progress: I've spent ~45 minutes on both my experimentation and this here write-up, maybe an hour.  You've been warned.


### Base URL

`https://images1-focus-opensocial.googleusercontent.com/gadgets/proxy`


### Parameters:

* `url`: original image URL
* `container`: must be "focus" ([i dunno lol](http://audito.re/mEbAjw.jpg))
* `refresh`: time (in seconds) to cache it on G's servers
* `resize_w`: width in pixels
* `resize_h`: height in pixels

You can either specify both `resize_*` parameters or just one.


### An example

Let's resize [that big 3964x1492px panorama picture I took in Istanbul last year](http://audito.re/1qYw_g.jpg).

**Make it square, 300x300px and cache it for 30 days:**

![Resized image, 300x300px](https://images1-focus-opensocial.googleusercontent.com/gadgets/proxy?url=https%3A%2F%2Fdl.dropboxusercontent.com%2Fu%2F7298%2Fblog%2FBlick_von_der_S%25C3%25BCleymaniye-Moschee.jpg&container=focus&resize_w=300&resize_h=300&refresh=2592000)

URL:

    https://images1-focus-opensocial.googleusercontent.com/gadgets/proxy?url=https%3A%2F%2Fdl.dropboxusercontent.com%2Fu%2F7298%2Fblog%2FBlick_von_der_S%25C3%25BCleymaniye-Moschee.jpg&container=focus&resize_w=300&resize_h=300&refresh=2592000

**Make it 650px wide, keep the aspect ratio and cache the result for a year:**

![Resized image, 650px wide](https://images1-focus-opensocial.googleusercontent.com/gadgets/proxy?url=https%3A%2F%2Fdl.dropboxusercontent.com%2Fu%2F7298%2Fblog%2FBlick_von_der_S%25C3%25BCleymaniye-Moschee.jpg&container=focus&resize_w=650&refresh=31536000)

URL:

    https://images1-focus-opensocial.googleusercontent.com/gadgets/proxy?url=https%3A%2F%2Fdl.dropboxusercontent.com%2Fu%2F7298%2Fblog%2FBlick_von_der_S%25C3%25BCleymaniye-Moschee.jpg&container=focus&resize_w=650&refresh=31536000


### Quirks

At least in Chrome, opening the URL in the browser will force the download of a `p.txt` file (which is actually a JPG).  Putting the URL in an `<img>` tag is fine, tho.  Or just use `curl` to save it locally.



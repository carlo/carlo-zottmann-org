---
title: "Blocking those ads on Xbox Live"
date: 2012-09-22
---

<summary><strong>Building a fire-and-forget ad blocker using OpenDNS.</strong></summary>

I am an avid Xbox Live user.  More to the point, I'm an avid Xbox Live Gold account owner for a number of years by now.

So, I've paid for the console, I'm paying for all my games, and I pay an ongoing monthly fee for the connectivity, experience, whatever you want to call it.  Still, Microsoft —proprietor of this fine service— thinks it's entirely sensible to put ads in the frontend, or show Kinect ads before videos.

![Screenshot dashboard ads](https://dl.dropbox.com/u/7298/blog/2012-09-22-dashboard.png)

I disagree.

<span class="highlight">So I'm using [OpenDNS](http://opendns.com) to block their ad servers on my Xbox for good.</span>  Here's how.[^1]

First up: I'm using a router, and both my Xbox and my main computer are getting their internets from it.  Since both of them go through the same router, they share the same external IP address.  If your setup is the same, this is what to do.


### What you'll do

First, you'll install the tiny OpenDNS client tool on your main machine so your OpenDNS account always knows about your current external IP.

Then, you'll configure your 360 to use OpenDNS' DNS server, so it'll adhere to your OpenDNS settings (blocked domains etc.).


### Setting up your Mac or PC

1. Create a free OpenDNS account.
2. [Download the OpenDNS Updater](https://dashboard.opendns.com/support/) for your main machine.  (There are official clients for both Windows or OS&nbsp;X.)
3. Go to OpenDNS's [settings page](https://dashboard.opendns.com/settings/) and create and/or select your home network.
4. Install the Updater and connect it to your OpenDNS account.  Make it auto-run on startup.
5. On the settings page for that network, set your "Web Content Filtering" level to whatever (mine is at "None"), but add the following individual domains to the "Always block" list:  
· `g.msn.com`  
· `rad.msn.com`  
· `rpt.rad.msn.com`  
· `global.msads.net`  
· `msnvidweb.vo.msecnd.net`

At this point your OpenDNS account will a) always know your home network's current IP address and b) block MS' ad servers.  Your network won't be affected by this, tho, as it doesn't actively use OpenDNS.


### Setting up your Xbox 360

1. On your Xbox, go to the Settings page/panel &rarr; System &rarr; Configure Network.
2. Select your active network connection and go to the DNS settings.  
![Screenshot Network Configuration](https://dl.dropbox.com/u/7298/blog/2012-09-22-configure_network_nxe.png)
3. Set the DNS setting to "manual", then the primary DNS server to `208.67.222.222` and the secondary DNS server to `208.67.220.220`.
4. On saving these settings, your Live account will be logged out.  Just log in again.

That's it.  Your Xbox is now using OpenDNS' DNS servers — and its blocking capabilities configured by your account; your desktop machine will auto-update your OpenDNS account with your IP address.  A perfect match.

If the dashboard is still showing ads, clear the 360's cache or wait a day or two for the ads to expire.

Disclaimer: works for me, YMMV, I take no responsibility.  Moo.

[^1]: I didn't come up with the idea myself: there's a [reddit post](http://www.reddit.com/r/gaming/comments/n5831/how_to_block_xbox_dashboard_ads/) on the topic that predates my post by about 9 months.

---
title: "Hazel Quick Tip: Automatically extract the actual installer from Adobe's Flash Player installer"
date: 2012-05-21
---

<summary><strong>Yo dawg I herd you like installers so we put an installer inside your installer so you can install while you install.</strong></summary>

Oh hey, there's [a new Adobe Flash Player release](http://get.adobe.com/flashplayer/) for Mac.  Wonderful.  Naturally, the download package is a DMG file (a disk image); you double-click it after downloading, that'll mount a new "drive", and there's the installer app.  Unfortunately, the suave bastards at Adobe's Mac division are too cool for school, so the installer app is not just a plain old Mac installer app, no siree.  They wrote their own fat installer, which during the install process _insists_ on you closing all your browsers _OR ELSE_.

A bit annoying, that.

But luckily, their own fat installer is basically just a bunch of fluff/clutter/bullshit around the _actual_ 0ld sk00l installer.  So, one could theoretically right-click the `Install Adobe Flash Player.app` after mounting the DMG, pick "Show Package Contents", and poke around to find the real installer, the one that doesn't annoy as much by not forcing you to close your browsers right away.

I've done this twice in the past, manually.  Well, a new Flash Player release is out, so let's automate this once and for all.

My weapon of choice in this case is the [highly useful Hazel](http://www.noodlesoft.com/hazel).  It's great for folder-based automation — it slices, it dices (…and I don't get a kickback).

So, here's what this new Hazel rule should do when I mount the download package `install_flash_player_osx.dmg`:

1. Copy the actual installer (`Adobe Flash Player.pkg`) from inside the `Install Adobe Flash Player.app` to my `~/Downloads` folder.
2. Unmount the disk image.

Easy!

Step 1: in Hazel's preference pane, link a new folder — "Volumes":

1. Click the "+" icon in the lower left corner.
2. In the Finder selection window navigate to your "Macintosh HD" root (in the sidebar's "Devices" section); it should contain a few folders, among them "Applications", "System", "Users".
3. It's likely you won't see "Volumes" because that folder is usually hidden.  We need to make it temporarily visible now.
4. We're moving dangerously close to _Matrix_ territory here, but stay calm, you've trained for this!  Press `Shift+Cmd+.` (period).  That'll make all the folder contents visible.
5. Find "Volumes", click it, then hit the "Open" button in the lower right corner.

That was the first step: Hazel should now show "Volumes" in the left-hand side "Folders" list, which means she's ready for you to add rules for that folder.  Fortunately, we only need one rule here.

Step 2: Add that one rule.

1. Click the "+" button in Hazel's right-hand side "Rules" section.
2. A new rules panel will appear.
3. Enter something meaningful in the "Name" field, ex. _"Flash Player: Copy actual installer to ~/Downloads and unmount"_.
4. In the second section, add a new condition for the file or folder being matched: (Name) (Is) (Flash Player).
5. In the third section, add the action: (Run shell script) (embedded script).  Click "Edit script" and paste the following code:

`cp -r /Volumes/Flash\ Player/Install\ Adobe\ Flash\ Player.app/Contents/Resources/Adobe\ Flash\ Player.pkg ~/Downloads/ && osascript -e "tell application \"Finder\" to eject \"Flash Player\""`

Here's what it should look like:

![Screenshot](//dl.dropbox.com/u/7298/blog/2012-05-21-hazel-quick-tip-extract-flash-player-installer.png)

If it does, click "OK".  You're done!

That's it.  Try it out, go download [Flash Player for Mac](http://get.adobe.com/flashplayer/) and double-click it (`install_flash_player_osx.dmg`).  Hazel should do her fine work, and a few seconds later you should find the real installer —`Adobe Flash Player.pkg`— in your `Downloads` folder.  And she'll do that for every new release you download.  Just double-click it and sit tight.

Here's to [Hazel](http://www.noodlesoft.com/hazel).  Helluva girl…  helluva girl.


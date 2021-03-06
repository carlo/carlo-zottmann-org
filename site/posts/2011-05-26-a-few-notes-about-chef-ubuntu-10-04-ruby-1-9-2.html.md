---
title: "A Few Notes About… Chef + Ubuntu 10.04 + Ruby 1.9.2 + RVM"
date: 2011-05-26
---

<summary><strong>TL;DR: ditch RVM on production systems unless you like pain.</strong></summary>

A few notes on getting [chef-client][1] to install a Ruby 1.9.2 Rails stack on a production box. I've been spending a good number of hours on this, and I've learned a couple of things I need to jot down real quick lest I forget.

Preface: as you'll see, I'm not a devops guy. I don't have to maintain a lot of servers, so I tend to forget after setting one up that once per year. Eh.

1. There's no current Ruby 1.9.2 package for Ubuntu 10.04. This made me think I would be best off using RVM as it's quite enjoyable and useful in a local development enviroment.

2. [RVM][2] is ace for development work but as it turns out it's kinda shit in a production environment. Up until a few versions ago the system-wide install of RVM was rather solid (for me) as RVM made sure gems for one particular Ruby went into the same folder no matter whether they were installed as root or regular user (let's ignore permissions for a moment here). That meant that even when a gem had been installed by a user the root user would see it -- if he was using the same RVM Ruby.

These days, you have to use `rvmsudo` to have your root shell use RVM. As provisioning systems like Chef don't know and/or care about `rvmsudo`, you're bound to run into issues as `chef-client` will happily keep installing his gems under Ruby 1.8 -- ignoring the 1.9.2 gems. Brilliant.

I've played around with various ways to cram RVM into my root shells, but it's been a wonky affair. It felt rather hacky and wobbly, i.e. not like something I want on my production machines.

3. Ditching RVM and spending an hour looking for a 10.04-compatible Ruby 1.9.2 package is less fun than it sounds. Hint: there are no current packages. My Linux-fu being what it is I've decided to not get sidetracked trying to hack together a package myself.

4. Finally I came to the conclusion that my own [knife bootstrap file][3] would be the way to go. ([Here's the file.][4]) The general idea being that installing/compiling 1.9.2 from source _before_ anything else would make my life easier. Both root and standard user would use the same Ruby install, no need for hacks and detours.

I put it in the right place (`chef-repo/.chef/bootstrap/`) and then just call it like this: `knife bootstrap mynode.example.com -r 'recipe[chef-client]' -x chef --sudo --distro ubuntu10.04-ruby192`

I was right. Works like a charm.

The rest was a walk in the cake, mostly. Not having RVM as middleman makes installations considerably more stable.

So, in retrospect I wonder why noone has bothered with a Ruby 1.9.2 package for Ubuntu 10.04 -- given it's used on so many servers? It's curious, really.
Also I now know why RVM is absent from so many cookbooks.

Live and learn, I suspect.

THE END.

PS: Bonus links! [chef-denyhosts][5], [chef-ufw][6].

**UPDATE / PPS:** Bonus link #3! [chef-ruby1.9][7]

[1]: http://www.opscode.com/chef/
[2]: http://rvm.beginrescueend.com/
[3]: http://wiki.opscode.com/display/chef/Knife+Bootstrap
[4]: https://gist.github.com/993853
[5]: https://github.com/carlo/chef-denyhosts
[6]: https://github.com/carlo/chef-ufw
[7]: https://github.com/carlo/chef-ruby1.9


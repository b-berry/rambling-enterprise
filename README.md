### Question 1

We receive an email about a security vulnerability in one of the libraries that make up the official package.

You are assigned to handle this report. How would you clear this from your queue?

> If this vulnerability involves unauthorized port traffic, the first thing I would do is confirm the iptables or other firewall configuration is set up to block traffic on that port.  Then, I would want to set up a development environment to clone the environment where this vulnerability exists.  I would investigate recent git logs to track down any unintentional vulnerability introductions in order to confirm reproduction of the vulnerability.  Once tracked down I would commit any found patches to a development branch and issue a pull request to be reviewed before merging into the production environment.

### Question 2

A user on a RHEL based machine runs `rpm -i packagename.rpm`. Describe what happens during the lifecycle of this command.

> It has been a while since I have used a rpm based distribution, but I used to run Fedora (`yum`) on my laptop while an undergraduate student.  The `rpm` command is the package manager, and is run with the `-i` flag to install the specified packege (.rpm).  When exececuted, `rpm` will source the specfile for build, install and clean instructions with triggers for four sequences:
>
> 1. The `%pre` hook - preinstallation, looks for any package dependencies and mark them for installation and then copy build files to the buildroot for installation
> 2. The `%post` hook - postinstallation, removes any buildroot files and older version candidates after package installation
> 3. The `%preun`  hook - preuninstallation, remove files not overwritten by the installation and execute uninstallations of obsolete dependencies
> 4. The `%postun` hook - postuninstallation, clean-up and maintenaince  post uninstall of old packages

### Question 3

After shipping a new feature in the project, a large customer reports back that they could not upgrade.

How do you approach this situation and how do you rule out the issues you may find on the way to a resolution?

What do you do once the issue is solved?

### Question 4

Can you write a small Ruby based script/app that will get HTTP response times over 5 minutes from your location to https://gitlab.com?

```bash
$ ./getHttpTime.rb -h
Usage: getHttpTime.rb [options]

Specific options:
    -d, --duration FLOAT             Specify test duration          default: 300s
    -i, --interval FLOAT             Specify interval duration      default: 5s
    -u, --url URL                    Specify Host URL               default: https://github.com
    -h, --help                       Prints this help
```

```bash
$ ./getHttpTime.rb -d 300 -i 12 -u https://gitlab.com
#<OpenStruct encoding="utf8", dur=300.0, int=12.0, url="https://gitlab.com">
  Running HTTP::Get response test for -       Duration:300.0s Every:12.0s
  # -                      Time - ### -  Response message -  Request Time
  1 - 2017-03-20 22:53:43 -0700 - 302 -             Found - 0.53997755051
  2 - 2017-03-20 22:53:55 -0700 - 302 -             Found - 0.54482388496
  3 - 2017-03-20 22:54:08 -0700 - 302 -             Found - 0.54431772232
  4 - 2017-03-20 22:54:21 -0700 - 302 -             Found - 0.51879262924
  5 - 2017-03-20 22:54:33 -0700 - 302 -             Found - 0.45119357109
  6 - 2017-03-20 22:54:45 -0700 - 302 -             Found - 0.45418977737
  7 - 2017-03-20 22:54:58 -0700 - 302 -             Found - 0.64790248871
  8 - 2017-03-20 22:55:11 -0700 - 302 -             Found - 0.45730233192
  9 - 2017-03-20 22:55:23 -0700 - 302 -             Found - 0.54169011116
 10 - 2017-03-20 22:55:36 -0700 - 302 -             Found - 0.58155059814
 11 - 2017-03-20 22:55:48 -0700 - 302 -             Found - 0.79965758324
 12 - 2017-03-20 22:56:01 -0700 - 302 -             Found - 0.49255084991
 13 - 2017-03-20 22:56:13 -0700 - 302 -             Found - 0.43938565254
 14 - 2017-03-20 22:56:26 -0700 - 302 -             Found - 0.54602742195
 15 - 2017-03-20 22:56:39 -0700 - 302 -             Found - 0.69731640816
 16 - 2017-03-20 22:56:51 -0700 - 302 -             Found - 0.49346637726
 17 - 2017-03-20 22:57:04 -0700 - 302 -             Found - 0.90215063095
 18 - 2017-03-20 22:57:17 -0700 - 302 -             Found - 0.90229797363
 19 - 2017-03-20 22:57:30 -0700 - 302 -             Found - 0.63284993172
 20 - 2017-03-20 22:57:42 -0700 - 302 -             Found - 0.45859313011
 21 - 2017-03-20 22:57:55 -0700 - 302 -             Found - 0.48250365257
 22 - 2017-03-20 22:58:07 -0700 - 302 -             Found - 0.48305296898
 23 - 2017-03-20 22:58:20 -0700 - 302 -             Found - 0.86442136765
 24 - 2017-03-20 22:58:33 -0700 - 302 -             Found - 0.90270161629
                                      -        Total time -  Average Time
                                      -    14.37871623038 - 0.59911317627

```

### Other questions related to your candidacy

Do you have remote working experience?

> I have been 100% remote for more than two years of my 5 years as a Linux Engineer and Content Developer for the Liquid Galaxy project for a small tech firm based out of New York, NY.  In that time, I have found the remote office setting to be extremely productive and rewarding.  I participate in dialy stand-up meetings and extended weekly team project meetings.  We also coordinate through Zulip chat, Trello and Github issue tracking.

Can you describe your Chef experience?

> I have almost 5 years of experience configuring Chef nodes, cookbooks, and encrypted databags using a privately provisioned Chef-server.  I have experience troubleshooting Chef client issues on remote servers, deployment of bumped cookbooks and modified environments and performing these tasks always under revision tracking with Git.  My changes to a local checkout are pushed to the remote origin and are passed through a Jenkins CI pipeline before being deployed to a live system.

Do you have an open source project that you own or contributed to that you feel particularly proud about?

> As a content developer on the Liquid Galaxy project, I've contrubuted to a Ruby Gem created in-house to automate KML source content for our interactive plateform.  This library calculates the necessary geospatial relationships to create geosyncronous drawn polygons and/or flight dynamics intended for Google Earth and other geodatic virtual tours. 

> [Kamelopard Ruby Gem](https://rubygems.org/gems/kamelopard/versions/0.0.16 "Ruby Gems Kamelopard Page")

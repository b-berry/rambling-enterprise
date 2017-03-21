### Question 1

We receive an email about a security vulnerability in one of the libraries that make up the official package.

You are assigned to handle this report. How would you clear this from your queue?

### Question 2

A user on a RHEL based machine runs `rpm -i packagename.rpm`. Describe what happens during the lifecycle of this command.

### Question 3

After shipping a new feature in the project, a large customer reports back that they could not upgrade.

How do you approach this situation and how do you rule out the issues you may find on the way to a resolution?

What do you do once the issue is solved?

### Question 4

Can you write a small Ruby based script/app that will get HTTP response times over 5 minutes from your location to https://google.com?

```bash
$ ./getHttpTime.rb -h
Usage: getHttpTime.rb [options]

Specific options:
    -d, --duration FLOAT             Specify test duration          default: 300s
    -i, --interval FLOAT             Specify interval duration      default: 5s
    -u, --url URL                    Specify Host URL               default: https://google.com
    -h, --help                       Prints this help
```

```bash
$ ./getHttpTime.rb -d 300 -i 12 -u http://gitlab.com

#<OpenStruct encoding="utf8", dur=300.0, int=12.0, url="http://gitlab.com">
  Running HTTP::Get response test for -       Duration:300.0s Every:12.0s
  # -                      Time - ### -  Response message -  Request Time
  1 - 2017-03-20 18:39:01 -0700 - 301 - Moved Permanently - 0.21637463570
  2 - 2017-03-20 18:39:13 -0700 - 301 - Moved Permanently - 0.22416901588
  3 - 2017-03-20 18:39:26 -0700 - 301 - Moved Permanently - 0.21351289749
  4 - 2017-03-20 18:39:38 -0700 - 301 - Moved Permanently - 0.37206268311
  5 - 2017-03-20 18:39:50 -0700 - 301 - Moved Permanently - 0.22354507446
  6 - 2017-03-20 18:40:03 -0700 - 301 - Moved Permanently - 0.25019073486
  7 - 2017-03-20 18:40:15 -0700 - 301 - Moved Permanently - 0.21959805489

...

 18 - 2017-03-20 18:42:30 -0700 - 301 - Moved Permanently - 0.21018958092
 19 - 2017-03-20 18:42:42 -0700 - 301 - Moved Permanently - 0.21782708168
 20 - 2017-03-20 18:42:54 -0700 - 301 - Moved Permanently - 0.21468186378
 21 - 2017-03-20 18:43:06 -0700 - 301 - Moved Permanently - 0.21920585632
 22 - 2017-03-20 18:43:19 -0700 - 301 - Moved Permanently - 0.27072548866
 23 - 2017-03-20 18:43:31 -0700 - 301 - Moved Permanently - 0.21427583694
 24 - 2017-03-20 18:43:43 -0700 - 301 - Moved Permanently - 0.36681866646
 25 - 2017-03-20 18:43:55 -0700 - 301 - Moved Permanently - 0.23903155327
                                          -    Total time -  Average Time
                                          - 6.31219863891 - 0.25248794556

```

### Other questions related to your candidacy

Do you have remote working experience?

Can you describe your Chef experience?

Do you have an open source project that you own or contributed to that you feel particularly proud about?

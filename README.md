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
  1 - 2017-03-20 22:31:17 -0700 - 302 -             Found - 0.51965641975
  2 - 2017-03-20 22:31:30 -0700 - 302 -             Found - 0.47097682953
  3 - 2017-03-20 22:31:42 -0700 - 302 -             Found - 0.49256658554
  4 - 2017-03-20 22:31:55 -0700 - 302 -             Found - 0.90249037743
  5 - 2017-03-20 22:32:07 -0700 - 302 -             Found - 0.49267506599
  6 - 2017-03-20 22:32:20 -0700 - 302 -             Found - 0.59672808647
  7 - 2017-03-20 22:32:33 -0700 - 302 -             Found - 0.59303617477
  8 - 2017-03-20 22:32:45 -0700 - 302 -             Found - 0.56766295433
  9 - 2017-03-20 22:32:58 -0700 - 302 -             Found - 0.48461866379
 10 - 2017-03-20 22:33:10 -0700 - 302 -             Found - 0.71326446533
 11 - 2017-03-20 22:33:23 -0700 - 302 -             Found - 0.48578929901
 12 - 2017-03-20 22:33:36 -0700 - 302 -             Found - 0.67154049873
 13 - 2017-03-20 22:33:48 -0700 - 302 -             Found - 0.42354059219
 14 - 2017-03-20 22:34:01 -0700 - 302 -             Found - 0.56482267380
 15 - 2017-03-20 22:34:13 -0700 - 302 -             Found - 0.54597759247
 16 - 2017-03-20 22:34:26 -0700 - 302 -             Found - 0.54620814323
 17 - 2017-03-20 22:34:38 -0700 - 302 -             Found - 0.53841662407
 18 - 2017-03-20 22:34:51 -0700 - 302 -             Found - 0.69787740707
 19 - 2017-03-20 22:35:04 -0700 - 302 -             Found - 0.69761037827
 20 - 2017-03-20 22:35:16 -0700 - 302 -             Found - 0.44093418121
 21 - 2017-03-20 22:35:29 -0700 - 302 -             Found - 0.59902071953
 22 - 2017-03-20 22:35:41 -0700 - 302 -             Found - 0.54075813293
 23 - 2017-03-20 22:35:54 -0700 - 302 -             Found - 0.49829912186
 24 - 2017-03-20 22:36:06 -0700 - 302 -             Found - 0.48764610291
                                          -    Total time -  Average Time
                                          - 13.57211709021 - 0.56550487876
```

### Other questions related to your candidacy

Do you have remote working experience?

Can you describe your Chef experience?

Do you have an open source project that you own or contributed to that you feel particularly proud about?

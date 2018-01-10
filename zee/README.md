# Question 1
What is the difference between pod and deployment in Kubernetes?

# Question 2
A user on a RHEL based machine runs `rpm -i packagename.rpm`. Describe what happens during the lifecycle of this command.

> It has been a while since I have consistenty ran a rpm based distribution, but I used to run Fedora in university computational mathematics labs on my laptop while an undergraduate student.  
> The `rpm` command is the package manager, and is run with the `-i` flag to install the specified packege (.rpm).  When executed, `rpm` will source the specfile for build, install and clean instructions with triggers for four sequences:
>
> 1. The `%pre` hook - preinstallation, looks for any package dependencies and mark them for installation and then copy build files to the buildroot for installation
> 2. The `%post` hook - postinstallation, removes any buildroot files and older version candidates after package installation
> 3. The `%preun`  hook - preuninstallation, remove files not overwritten by the installation and execute uninstallations of obsolete dependencies
> 4. The `%postun` hook - postuninstallation, clean-up and maintenance  post uninstall of old packages

# Question 3
In your view, describe 1 challenge and 1 advantage of both monolithic and microservice architectures. 

# Question 4
Can you write a small Ruby based script/app that will get HTTP response times over 5 minutes from your location to https://gitlab.com?

See source at [getHttpTime.rb](getHttpTime.rb):

```bash
$ ./getHttpTime.rb -h
Usage: getHttpTime.rb [options]

Specific options:
    -d, --duration FLOAT             Specify test duration          default: 300s
    -i, --interval FLOAT             Specify interval duration      default: 5s
    -u, --url URL                    Specify Host URL               default: https://github.com
    -h, --help                       Prints this help
```

Snippit of [results](getHttpTime.results):

```bash
$ ./getHttpTime.rb -u gitlab.com > getHttpTime.results
```

```bash
$ head getHttpTime.results 
#<OpenStruct encoding="utf8", dur=300, int=5, url="gitlab.com">
  Running HTTP::Get response test for -            Duration:300s Every:5s
  # -                      Time - ### -  Response message -  Request Time
  1 - 2018-01-09 13:13:43 -0800 - 200 -                OK - 0.21318816900
  2 - 2018-01-09 13:13:48 -0800 - 200 -                OK - 0.23318464800
  3 - 2018-01-09 13:13:53 -0800 - 200 -                OK - 0.18779766000
  4 - 2018-01-09 13:13:59 -0800 - 200 -                OK - 0.23066326500
  5 - 2018-01-09 13:14:04 -0800 - 200 -                OK - 0.21262151100
  6 - 2018-01-09 13:14:09 -0800 - 200 -                OK - 0.18873145700
  7 - 2018-01-09 13:14:14 -0800 - 200 -                OK - 0.18500198800
```



# Other questions related to your candidacy

## QQ1: Do you have remote working experience?

> I have been 100% remote for 2.5 of my 5 years as a Linux Engineer and Content Developer for the [Liquid Galaxy](https://liquidgalaxy.endpoint.com)  project for a small tech firm based out of New York, NY.  In that time, I have found the remote office setting to be extremely productive and rewarding.  I participate in daily stand-up meetings and extended weekly team project meetings.  We also coordinate through Zulip chat, Trello and Github issue tracking.

## QQ2: Are there any other languages you have significant experience in?

> I am very confortable in the Bash environment as well as Python scripting.  I am often writing [tools](https://github.com/b-berry/b-berry-bin) to automate and/or fascilitate everyday tasks on my workstation.  If I have to do something more than 7 times, I would prefer to start automating such an activity.

## QQ3: Can you describe your Chef and packaging experience?

> I have more than 5 years of experience configuring Chef nodes, cookbooks, and encrypted databags using a privately provisioned Chef-server.  I have experience troubleshooting Chef client issues on remote servers, deployment of bumped cookbooks and modified environments and performing these tasks always under revision tracking with Git.  My changes to a local checkout are pushed to the remote origin and are passed through a Jenkins CI pipeline before being deployed to a live system.

## QQ4: Do you have an open source project that you own or contributed to that you feel particularly proud about?

> As a content developer on the Liquid Galaxy project, I'm a contributing author to a Ruby Gem created in-house to automate KML source content for our interactive platform.  This library calculates the necessary geospatial relationships to create geosynchronous content, typically drawn shape polygons and/or flight dynamics intended for Google Earth and other geodatic virtual tours. 
>
> [Liquid Galaxy](https://liquidgalaxy.endpoint.com "Liquid Galaxy by End Point Homepage")
>
> [Kamelopard Ruby Gem](https://rubygems.org/gems/kamelopard/versions/0.0.16 "Ruby Gems Kamelopard Page")

> I've also begun writing a geocoding, kml/czml asset creation tool [lg-geocode.py](https://github.com/b-berry/b-berry-bin/blob/master/lg-geocode.py) as a project both to fascilitate content development projects in my current role as well as a personal excersize to become more comfortable within the Python environment.

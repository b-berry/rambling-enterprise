# Question 1
What is the difference between pod and deployment in Kubernetes?

# Question 2
A user on a RHEL based machine runs `rpm -i packagename.rpm`. Describe what happens during the lifecycle of this command.

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
$ head getHttpTime.results 
#<OpenStruct encoding="utf8", dur=300, int=5, url="github.com">
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

## QQ2: Are there any other languages you have significant experience in?

## QQ3: Can you describe your Chef and packaging experience?

## QQ4: Do you have an open source project that you own or contributed to that you feel particularly proud about?

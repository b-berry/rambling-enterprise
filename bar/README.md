# Linux
- How do you get the exit status of the last command that was run in a Linux bash shell.
  - I'd query the exit status variable after the command completes:
  ```bash
  $ echo $?
  ```
- What is the difference between a copy, hard link and a soft link?
  - `cp` - Will create a copy of the source file with a new inode
  - `ln` - Will create a hard link, which links to the source file's inode
  - `ln -s` - Will create a soft link, which references the source file's filename

- What is an ‘inode’? How do you find the inode for `/etc/passwd`?
  - An inode stores attributes for a file on the filesystem as well the block location.
  - `ls -i /etc/passwd` will show the inode location for this file

- What information can be found within the /proc filesystem.
  - `/proc` contains runtime system information such as system memory, mounted devices, and modules

- There is a process running on tcp port 1234. How do you identify which process it is?
  -  `lsof -i :1234` would show me the process running on port 1234.


# Jenkins
- What is the primary use case for using a Jenkins ‘matrix’ job?
> As discussed in my phone call with Dominic, I am a daily consumer of Jenkins CI.  That said, I have not been responsible for configuring Jenkins.  My interaction is as such: When I need to push an update to our Chef configurations, I commit my changes and push to origin master branch.  Then, I log into our Jenkins interface, find my deployment test job, and confirm that my commit is qued for testing and passes testing for deployment.
- Name two to three CI systems and tell us the pros and cons of each, with a bias towards personal experiences.
- Identify a few key benefits of using Jenkins Job DSL (or similar technology) to define jobs vs using the GUI for configuration
- Bonus questions:
  - Explain how you would use Jenkins Job DSL to create a dozen similar jobs withslight variations.
  - How would you use Jenkins Job DSL to create jobs across multiple development branches?


# Networking
- What is an arp table?
> An arp table (Address Resolution Protocall) is the system's cache of network addresses.  The arp table stores editable IPv4 address information.
- What is DNS?
> The Domain Name System is an internet naming system that associates domain names with IP addresses.
- You know a server is up and normally responds to pings, what are some reasons why you can no longer ping it?
> DNS resolution could be down, and/or a network switch in the route from my machine to the server I'm trying to reach could be down.
- How can you discover what ports are listening on a server?
> I would utilize `nmap` to get a scan report of the server.  If I have access to the server, I could also run `lsof -i` to list open network files.
- Describe how you would troubleshoot networking problems including the tools you would use
  - My first test would be basic packet loss evaluation using `ping` over the domain name or IP address
    - If the domain name doesnt resolve, I would check `/etc/hosts` if it is a locally defined host and run again over the configured IP
  - I would employ `traceroute` to follow the various network switches from my machine to the host in question.
  - If I suspect DNS issues, I would use `dig` or `nslookup` to see domain name resolution to IP addresses configuration
  - Once I have IP address resolution, I can test connectivity directly to these IPs via `ping` to confirm DNS issues
  - If I have root access on the server in question, I would want to check `iptables` or other firewall config for `:80 && :443` open if using http and https respectively
    - I would also then check `dnsmasq` service on the host if applicable, restart to clear dns cache

# Puppet
- Identify a few key benefits of using configuration management tools, such as Puppet.
> My experience with configuration management is within Chef.  I currently work with a privately configured chef-server to write cookbooks and recipes to deploy version controlled software packages and custom system configuration.  One real benefit is controlling software versioning by setting environment deployment caps so that I can safely deploy production ready repository tags to production systems and reduce accidental version bums, where non-production ready code revisions are deployed to production systems.
- Name some common resource types in Puppet.
> Again my experience here lies in Chef, where we have `node-definitions` for custom override configurations per host, `cookbooks` to deploy suites of software packages, `recipies` that dictate the installation procedure of individual packages.  These deployment configs are packaged and defined through setting `role` configurations and version controlled through `enviroment` parameters.
- In Puppet how do you make sure a certain version of a package is installed?
> While I don't have specific experience with Puppet, I am very flexible and eager to learn new software suites and methods of configuration management.
- In Puppet how do you define dependencies between resources?


# AWS
- What is an AMI?
> At this point in time I don't have AWS experience, but again, I would welcome and in fact look forward to learning about provisioning AWS services into my daily infastructure.
- What is the value of having multiple EC2 instance types?
- What is an EC2 ‘Reserved Instance’?
- What is the primary difference between an EC2 ‘Reserved’ and ‘On-Demand’ instances?


# Coding
Using the language of your choice, write solutions to the following problems:
- Given a text file that contains one integer per line, write a function that sums up the integers and prints the result and the number of integers found in the file.
```bash
  1 #!/bin/bash
  2 
  3 # This bash script assums an infile contains one integer per line
  4 
  5 INFILE='./int_sample.txt'
  6 SUM=0;
  7 
  8 while read LINE; do
  9   (( SUM = $SUM + $LINE ));
 10 done< <(cat $INFILE);
 11 
 12 echo "Sum: $SUM" &&\
 13 echo "Count: $(cat $INFILE | wc -l)"
```

For the following problems, please consider the efficiency and complexity of your solutions, in particular consider how your solution would scale with a very large data set.
- Find the largest integer value in an array of integers.
```python
  1 #!/usr/bin/python
  2 
  3 # Define sample data
  4 sample = [ 2, 5, 9, 11, 3, 6, 7, 4 ]
  5 
  6 def find_max(data):
  7     max_int = max(data)
  8     max_index = data.index(max_int)
  9     return max_int, max_index
 10 
 11 results = []
 12 results = find_max(sample)
 13 
 14 print "Found max value: %s at index: %s" %(results[0], results[1])
```
- Given an ordered list such as `[1, 2, 3, 5]` find any pair of numbers that sum to 8.
  - Run your above solution with the list `[1,2,4,4]`
    ```ruby
      1 #!/usr/bin/env ruby
      2 
      3 require 'pry'
      4 
      5 List = [1,2,4,4]
      6 SumTest = 8
      7 
      8 results = []
      9 
     10 # Run through parent List
     11 List.each_with_index do |item,index|
     12     (0..List.length).step(1) do |n|
     13         # Skip if self
     14         next if n == index
     15         sum = item.to_i + List[n].to_i
     16         if sum == SumTest 
     17             # Store results
     18             results << { :int1 => item,
     19                          :loc1 => index,
     20                          :int2 => List[n],
     21                          :loc2 => n,
     22                          :sum => sum
     23                         }
     24         end
     25     end
     26 end 
     27 
     28 puts results
    ```   
  - returns:
    ```bash
    $ ruby coding_3a.rb 
    {:int1=>4, :loc1=>2, :int2=>4, :loc2=>3, :sum=>8}
    {:int1=>4, :loc1=>3, :int2=>4, :loc2=>2, :sum=>8}
    ```
  - Bonus: find a pair of values that sum to 8 in an *unordered* list such as `[5, 4, 1,3]`
    ```ruby
      1 #!/usr/bin/env ruby
      2 
      3 require 'pry'
      4 
      5 List = [5, 4, 1,3]
      6 SumTest = 8
      7 
      8 results = []
      9 
     10 # Run through parent List
     11 List.each_with_index do |item,index|
     12     (0..List.length).step(1) do |n|
     13         # Skip if self
     14         next if n == index
     15         sum = item.to_i + List[n].to_i
     16         if sum == SumTest
     17             # Store results
     18             results << { :int1 => item,
     19                          :loc1 => index,
     20                          :int2 => List[n],
     21                          :loc2 => n,
     22                          :sum => sum
     23                         }
     24         end
     25     end
     26 end
     27 
     28 puts results
    ```
  - returns:
    ```bash
    $ ruby coding_3b.rb 
    {:int1=>5, :loc1=>0, :int2=>3, :loc2=>3, :sum=>8}
    {:int1=>3, :loc1=>3, :int2=>5, :loc2=>0, :sum=>8}
    ```

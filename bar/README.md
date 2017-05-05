# Linux
- How do you get the exit status of the last command that was run in a Linux bash shell.
```bash
$ echo $?
```
- What is the difference between a copy, hard link and a soft link?
> `cp` - Will create a copy of the source file with a new inode
> `ln` - Will create a hard link, which links to the source file's inode
> `ln -s` - Will create a soft link, which references the source file's filename

- What is an ‘inode’? How do you find the inode for `/etc/passwd`?
> An inode stores attributes for a file on the filesystem as well the block location.
> `ls -i /etc/passwd` will show the inode location for this file

- What information can be found within the /proc filesystem.
> `/proc` contains runtime system information such as system memory, mounted devices, and modules

- There is a process running on tcp port 1234. How do you identify which process it is?
> `lsof -i :1234` would show me the process running on port 1234.


# Jenkins
- What is the primary use case for using a Jenkins ‘matrix’ job?
- Name two to three CI systems and tell us the pros and cons of each, with a bias towards personal experiences.
- Identify a few key benefits of using Jenkins Job DSL (or similar technology) to define jobs vs using the GUI for configuration
- Bonus questions:
  - Explain how you would use Jenkins Job DSL to create a dozen similar jobs withslight variations.
  - How would you use Jenkins Job DSL to create jobs across multiple development branches?


# Networking
- What is an arp table?
- What is DNS?
- You know a server is up and normally responds to pings, what are some reasons why you can no longer ping it?
- How can you discover what ports are listening on a server?
- Describe how you would troubleshoot networking problems including the tools you would use


# Puppet
- Identify a few key benefits of using configuration management tools, such as Puppet.
- Name some common resource types in Puppet.
- In Puppet how do you make sure a certain version of a package is installed?
- In Puppet how do you define dependencies between resources?


# AWS
- What is an AMI?
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
    
  - Bonus: find a pair of values that sum to 8 in an *unordered* list such as `[5, 4, 1,3]`

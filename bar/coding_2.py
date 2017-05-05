#!/usr/bin/python

# Define sample data
sample = [ 2, 5, 9, 11, 3, 6, 7, 4 ]

def find_max(data):
    max_int = max(data)
    max_index = data.index(max_int)
    return max_int, max_index

results = []
results = find_max(sample)

print "Found max value: %s at index: %s" %(results[0], results[1])

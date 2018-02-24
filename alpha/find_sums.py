#!/usr/bin/python
import argparse
import itertools
import math

# Current functionality:
# $ python find_sums.py 15 5 5 15 10
# Target Sum: 15 from List: [[5, 5, 15, 10]]

def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("SUM",type=int,
        help='Find combinations that sum=SUM')
    parser.add_argument("INTEGERS",type=int,nargs=4,
        action='append',help='List containing 4 integers')
    args = parser.parse_args()

    total_combinations = calc_combinations(args.INTEGERS, args.SUM)

    print "Results: %s" %total_combinations

def calc_combinations(integer_set,target_sum):

    print "Target Sum: %s from List: %s" %(target_sum,integer_set)

    #import code; code.interact(local=dict(globals(), **locals()))
    results = []
    for i in range(len(integer_set[0])):
        for n in itertools.combinations(integer_set[0],i):
            if sum(n) == target_sum:
                # Debug STDOUT
                print "Found set: %s Sum: %s" %(n,sum(n))
                results.append([n,sum(n)])

    return results

if __name__ == "__main__":
    main()

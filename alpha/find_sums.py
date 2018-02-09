#!/usr/bin/python
import argparse
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

    #import code; code.interact(local=dict(globals(), **locals()))
    total_combinations = calculate_combinations(args.INTEGERS, args.SUM)

def calculate_combinations(integer_set,target_sum):

    print "Target Sum: %s from List: %s" %(target_sum,integer_set)
    exit()

if __name__ == "__main__":
    main()

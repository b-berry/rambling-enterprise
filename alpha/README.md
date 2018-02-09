#QUESTION

> Write a function that given an input set of integers with 4 entries and a desired
> target sum, returns the set of combinations of any length that add up to that target sum. 

> Each set of combinations must be specified by the indexes (0-based) of the integers. See examples below.

> Any language can be used.

##EXAMPLE 1:


`total_combinations = calculate_combinations(input=[5, 5, 15, 10], target_sum=15)`

###ANSWER 1: 

> should return 3 sets, as there are 3 combinations of numbers from the input array that add up to 15, namely:

 
```
[2]           => input[2] = 15

[0, 3]       => input[0] = 5, input[3] = 10, sum = 15

[1, 3]       => input[1] = 5, input[3] = 10, sum = 15
```

##EXAMPLE 2:

`total_combinations = calculate_combinations(input=[1, 2, 3, 4], target_sum=6)`

###ANSWER 2: 

> should return 2 sets, as there are 2 combinations of numbers from the input array that add up to 6, namely:

```
[0, 1, 2]

[1, 3]
```
 

###BONUS Points

> How would you extend it to deal with a varying length input array?

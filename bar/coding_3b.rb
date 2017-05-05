#!/usr/bin/env ruby

require 'pry'

List = [5, 4, 1,3] 
SumTest = 8

results = []

# Run through parent List
List.each_with_index do |item,index|
    (0..List.length).step(1) do |n|
        # Skip if self
        next if n == index
        sum = item.to_i + List[n].to_i
        if sum == SumTest
            # Store results
            results << { :int1 => item,
                         :loc1 => index,
                         :int2 => List[n],
                         :loc2 => n,
                         :sum => sum 
                        }
        end
    end
end

puts results

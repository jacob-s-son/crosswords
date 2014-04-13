require "./lib/crosswords"

path = "./dict.txt"

each_10th_word = IO.readlines(path).each_with_index.inject([]) do |arr, (line, idx)|
  idx % 10 == 0 ? arr << line.match(/^([A-Z]+)\s/)[1].to_s : arr
end

dictionary = Crosswords::Dictionary.new(path)


require 'benchmark'

puts "Time for loading #{each_10th_word.size} words"
Benchmark.bmbm do |bench|
  bench.report { each_10th_word.each {|w| dictionary.find( w ) } }
end


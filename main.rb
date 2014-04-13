require "./lib/crosswords"

path = "./dict.txt"

all_words = IO.readlines(path).map {|line| line.match(/^([A-Z]+)\s/)[1].to_s }

each_2nd_word = all_words.each_with_index.inject([]) do |arr, (line, idx)|
  idx % 2 == 0 ? arr << line : arr
end

each_3rd_word = all_words.each_with_index.inject([]) do |arr, (line, idx)|
  idx % 3 == 0 ? arr << line : arr
end

each_5th_word = all_words.each_with_index.inject([]) do |arr, (line, idx)|
  idx % 5 == 0 ? arr << line : arr
end

each_10th_word = all_words.each_with_index.inject([]) do |arr, (line, idx)|
  idx % 10 == 0 ? arr << line : arr
end

dictionary = Crosswords::Dictionary.new(path)


require 'benchmark'

puts "Time for finding words in dictionary"

Benchmark.bmbm do |bench|
  bench.report("Each 10th word") { each_10th_word.each {|w| dictionary.find( w ) } }
  bench.report("Each 5th word")  { each_5th_word.each  {|w| dictionary.find( w ) } }
  bench.report("Each 3rd word")  { each_3rd_word.each  {|w| dictionary.find( w ) } }
  bench.report("Each 2nd word")  { each_2nd_word.each  {|w| dictionary.find( w ) } }
  bench.report("All words")      { all_words.each      {|w| dictionary.find( w ) } }
end




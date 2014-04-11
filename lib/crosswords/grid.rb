module Crosswords
  class Grid
    attr_reader :cells
    attr_reader :columns
    attr_reader :rows

    def initialize(n)
      @n      = n
      letters = ('A'..'Z').to_a

      @columns = Array.new( n ) { Array.new(n) }
      @rows    = Array.new( n ) { Array.new(n) }

      (0..n-1).each do |idx|
        (0..n-1).each do |idx2|

          cell = letters[rand( letters.size )]
          @rows[idx][idx2]  = cell
          @columns[idx2][idx] = cell
        end
      end
    end
  end
end
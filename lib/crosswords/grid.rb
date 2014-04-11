module Crosswords
  class Grid
    attr_reader :cells
    attr_reader :columns
    attr_reader :rows

    class << self
      def generate_from_matrix(matrix)
        new( nil, matrix )
      end
    end

    def initialize(n = nil, matrix = nil)
      generate_new(n)              if n
      generate_from_matrix(matrix) if matrix
    end

  private
    def generate_new(n)
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

    def generate_from_matrix(matrix)
      @n    = matrix.first.size
      @rows = matrix

      @columns = @rows.each_with_index.inject( [] ) do | cols, (row, idx) |
        row.each_with_index do |cell, idx2|
          cols[idx2]      ||= []
          cols[idx2][idx] ||= cell
        end

        cols
      end
    end
  end
end
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

    def horizontal_letters
      @horizontal_letters ||= @rows.map(&:join)
    end

    def vertical_letters
      @vertical_letters   ||= @columns.map(&:join)
    end

    def diagonal_letters
      @diagonal_letters ||= begin
        # first half of the diagonals, starting from the left
        (0..@n - 1).map do |idx|
          (0..idx).inject("") do |str, i|
            str << columns[i][@n - 1 - idx + i]
          end
        end +
        # from the middle to the left
        (1..@n - 1).map do |idx|
          (0..@n - 1 - idx).inject("") do |str, i|
            str << columns[idx+i][i]
          end
        end
      end
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
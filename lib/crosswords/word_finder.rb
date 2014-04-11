module Crosswords
  class WordFinder
    def initialize(grid, dictionary)
      @grid       = grid
      @dictionary = dictionary
    end

    def find(direction)
      case direction
        when 'horizontal_from_the_left'
          all_words_for_letters( @grid.horizontal_letters )
        when 'horizontal_from_the_right'
          all_words_for_letters( @grid.horizontal_letters, true )
        when 'vertical_from_the_top'
          all_words_for_letters( @grid.vertical_letters )
        when 'vertical_from_the_bottom'
          all_words_for_letters( @grid.vertical_letters, true )
        else
          raise 'Unknown direction'
      end
    end
  private
    def all_words_for_letters(words_arr, reverse=false)
      words_arr.inject(Set.new) do |words, line_of_letters|
        line_of_letters = line_of_letters.reverse if reverse

        (0..line_of_letters.length - 1).each do |idx|
          if word = find_in_dictionary( line_of_letters[0..-idx-1] )
            words << word
          end

          if word = find_in_dictionary( line_of_letters[idx..-1]   )
            words << word
          end
        end

        words
      end
    end

    def find_in_dictionary(potential_word)
      @dictionary.find(potential_word)
    end
  end
end
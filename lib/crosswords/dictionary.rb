module Crosswords
  class Dictionary
    attr_reader :size

    def initialize(path)
      @path      = path
      dictionary
    end

    def dictionary
      @dictionary ||= begin
        @size = 0

        IO.readlines(@path).inject({}) do |dict, l|
          @size += 1
          word = l.match(/^([A-Z]+)\s/)[1].to_s
          dict[word.length] ||= {}
          dict[word.length][word[0]] ||= []

          dict[word.length][word[0]] << word

          dict
        end
      end
    end

    def find(potential_word)
      if dictionary.has_key?(potential_word.length) &&
        dictionary[potential_word.length].has_key?(potential_word[0])
        dictionary[potential_word.length][potential_word[0]].find { |w| w == potential_word }
      end
    end
  end
end
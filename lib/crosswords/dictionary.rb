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

        IO.readlines(@path).inject( HashWithPath.new( HashWithPath.new ) ) do |dict, l|
          @size += 1
          word = l.match(/^([A-Z]+)\s/)[1].to_s

          dict[word.length.to_s] = dict[word.length.to_s].
            deep_merge( word_to_tree(word, word) )

          dict
        end
      end
    end

    def find(potential_word)
      path = ( [potential_word.length.to_s] + potential_word.split('') ).join('.')
      dictionary.traverse_path(path)
    end
  private
    def word_to_tree(word, full_word, tree=HashWithPath.new( HashWithPath.new ))
      if word.length > 1
        tree[word[0]] = word_to_tree( word[1..-1], full_word )
      else
        tree[word[0]] = full_word
      end

      tree
    end
  end
end
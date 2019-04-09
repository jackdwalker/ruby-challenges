# Definition
# 
# Extend the definition class to have three different methods:
# 1. add_word(word, definition), should store a word and definition
# 2. lookup(word), should return a definition
# 3. total_words, should return the total number of words
# 
# Example:
# definition = Definition.new
# definition.add_word('ruby', 'A red, precious stone')
# definition.total_words -> should return 1
# definition.lookup('ruby') -> should return 'A red, precious stone'
#
# Check your solution by running the tests:
# ruby tests/06_definition_test.rb

class Definition
# Your code here
    attr_accessor :word_definition_hash

    def initialize()
        @word_definition_hash = {}
    end

    def add_word(word, definition)
        @word_definition_hash[word] = definition
    end

    def lookup(word)
        word_def = @word_definition_hash[word]
        puts "The definition for #{word} is #{word_def}"
    end

    def total_words
        return @word_definition_hash.length
    end

end

definition = Definition.new
definition.add_word('ruby', 'A red, precious stone')
definition.add_word('sapphire', 'A blue, precious stone')
definition.add_word('emerald', 'A green, precious stone')
definition.add_word('diamond', 'A clear, precious stone')
puts definition.total_words # -> should return 4
definition.lookup('ruby') # -> should return 'A red, precious stone'
puts definition.word_definition_hash
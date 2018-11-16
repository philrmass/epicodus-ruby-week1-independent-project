require 'pry'
require 'rspec'
require 'word_compare'

describe 'WordCompare#anagram' do
  it('checks anagram for simple lower-case words') do
    word_compare = WordCompare.new()
    expect(word_compare.anagram('pat', 'tap')).to(eq('These words are anagrams.'))
  end

  it('checks anagram for simple words with repeated letters') do
    word_compare = WordCompare.new()
    expect(word_compare.anagram('start', 'tarts')).to(eq('These words are anagrams.'))
  end

  it('checks anagram for capitalized words') do
    word_compare = WordCompare.new()
    expect(word_compare.anagram('Antler', 'Rental')).to(eq('These words are anagrams.'))
  end
end

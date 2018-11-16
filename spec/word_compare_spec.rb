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

  it('checks inputs for actual words') do
    word_compare = WordCompare.new()
    expect(word_compare.anagram('Target', 'Grnstt')).to(eq('You need to input actual words!'))
  end

  it('checks antigram if not anagram') do
    word_compare = WordCompare.new()
    expect(word_compare.anagram('Quick', 'Brown')).to(eq('These words have no letter matches and are antigrams.'))
  end

  it('checks anagram for phrases with valid words and punctuation') do
    word_compare = WordCompare.new()
    expect(word_compare.anagram("Can't rely on it.", "certainly, NOT!!")).to(eq('These words are anagrams.'))
  end

  it('checks mutual letters if not anagram') do
    word_compare = WordCompare.new()
    expect(word_compare.anagram('#reFactor', 'Developer!')).to(eq("These words aren't anagrams but 3 letters match: e, o, r."))
  end
end

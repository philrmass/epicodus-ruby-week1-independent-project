require 'pry'
require 'rspec'
require 'word_compare'

describe 'WordCompare#anagram' do
  it('checks if lower-case unpunctuated words are anagrams') do
    wordCompare = WordCompare.new('pat')
    expect(wordCompare.anagram('tap')).to(eq(true))
  end
end

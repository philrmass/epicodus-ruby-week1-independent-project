require 'pry'
require 'rspec'
require 'word_compare'

describe 'WordCompare#anagram' do
  it('checks if lower-case unpunctuated words are anagrams') do
    word_compare = WordCompare.new('pat')
    expect(word_compare.anagram('tap')).to(eq(true))
  end
end

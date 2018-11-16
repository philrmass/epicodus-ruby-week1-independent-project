require 'pry'
require 'rspec'
require 'word_compare'

describe 'WordCompare#anagram' do
  it('checks anagram for simple lower-case words') do
    word_compare = WordCompare.new('pat')
    expect(word_compare.anagram('tap')).to(eq(true))
  end

  it('checks anagram for simple words with repeated letters') do
    word_compare = WordCompare.new('start')
    expect(word_compare.anagram('tarts')).to(eq(true))
  end
end

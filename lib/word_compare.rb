class WordCompare
  def initialize(word)
    @word0_hash = hash_word(word.downcase())
  end

  def hash_word(word)
    letter_hash = Hash.new()
    letters = word.split('')
    letters.each do |letter|
      if letter_hash.include?(letter)
        letter_hash[letter] = letter_hash.fetch(letter) + 1
      else
        letter_hash.store(letter, 1)
      end
    end
    letter_hash
  end

  def anagram?(word1)
    word1_hash = hash_word(word1.downcase())
    @word0_hash == word1_hash
  end

  def anagram(word1)
    if anagram?(word1)
      'These words are anagrams.'
    else
      'These words NOT anagrams.'
    end
  end
end

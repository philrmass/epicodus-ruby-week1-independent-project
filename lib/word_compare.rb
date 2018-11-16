class WordCompare
  def get_words(phrase)
    phrase.downcase()
  end

  def hash_words(word)
    letter_hash = Hash.new()
    letters = word.split('')
    letters.each do |letter|
      if (letter != "'")
        if letter_hash.include?(letter)
          letter_hash[letter] = letter_hash.fetch(letter) + 1
        else
          letter_hash.store(letter, 1)
        end
      end
    end
    letter_hash
  end

  def mutual_hash_keys
    mutual_keys = []
    phrase0_keys = @phrase0_hash.keys()
    phrase0_keys.each do |key|
      if @phrase1_hash.include?(key)
        mutual_keys.push(key)
      end
    end
    mutual_keys
  end

  def word?(word)
    (word =~ /[aeiouy]/) != nil
  end

  def words?(words)
    word?(words)
  end

  def anagram?()
    @phrase0_hash == @phrase1_hash
  end

  def anagram(phrase0, phrase1)
    words0 = get_words(phrase0)
    words1 = get_words(phrase1)
    if (words?(words0) & words?(words1))
      @phrase0_hash = hash_words(words0)
      @phrase1_hash = hash_words(words1)
      if anagram?()
        'These words are anagrams.'
      else
        mutual_keys = mutual_hash_keys()
        if mutual_keys.empty?()
          'These words have no letter matches and are antigrams.'
        else
          'These words NOT anagrams.'
        end
      end
    else
      'You need to input actual words!'
    end
  end
end

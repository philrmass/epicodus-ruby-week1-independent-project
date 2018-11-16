class WordCompare
  def split_words(phrase)
    phrase.downcase().gsub(/[^a-z'-]/, ' ').split(' ')
  end

  def hash_word(word, hash)
    letters = word.split('')
    letters.each do |letter|
      if (letter != "'") & (letter != '-')
        if hash.include?(letter)
          hash[letter] = hash.fetch(letter) + 1
        else
          hash.store(letter, 1)
        end
      end
    end
  end

  def words_hash(words)
    words.reduce(Hash.new()) { |hash, word| hash_word(word, hash); hash}
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
    are_valid = true
    words.each do |word|
      if !word?(word)
        are_valid = false
      end
    end
    are_valid
  end

  def anagram?()
    @phrase0_hash == @phrase1_hash
  end

  def anagram(phrase0, phrase1)
    words0 = split_words(phrase0)
    words1 = split_words(phrase1)
    if (words?(words0) & words?(words1))
      @phrase0_hash = words_hash(words0)
      @phrase1_hash = words_hash(words1)
      if anagram?()
        'These words are anagrams.'
      else
        mutual_keys = mutual_hash_keys()
        if mutual_keys.empty?()
          'These words have no letter matches and are antigrams.'
        else
          keys_text = mutual_keys.sort.join(', ')
          "These words aren't anagrams but #{mutual_keys.length} letters match: #{keys_text}."
        end
      end
    else
      'You need to input actual words!'
    end
  end
end

class WordCompare
  def split_words(phrase)
    phrase.downcase().gsub(/[^a-z'-]/, ' ').split(' ')
  end

  def hash_word(word, hash)
    letters = word.split('').reject { |l| (l == "'") | (l == '-') }
    letters.reduce(hash) { |h, l| h.include?(l) ? h[l] = h.fetch(l) + 1 : h.store(l, 1); h }
  end

  def words_hash(words)
    words.reduce(Hash.new()) { |h, w| hash_word(w, h); h }
  end

  def mutual_hash_keys
    @phrase0_hash.keys().select { |k| @phrase1_hash[k] }
  end

  def word?(word)
    (word =~ /[aeiouy]/) != nil
  end

  def words?(words)
    words.reduce(true) { |ok, w| ok & word?(w) }
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

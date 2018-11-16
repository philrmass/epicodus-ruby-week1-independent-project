class WordCompare
  def initialize(word)
    @word = word
    @letter_hash = Hash.new()
    letters = @word.split('')
    letters.each do |letter|
      if @letter_hash.include?(letter)
        letter_count = @letter_hash.fetch(letter) + 1
        @letter_hash.fetch(letter, letter_count)
      else
        @letter_hash.store(letter, 1)
      end
    end
  end

  def anagram(other_word)
    is_anagram = true
    letter_hash = @letter_hash.clone
    other_letters = other_word.split('')
    other_letters.each do |other_letter|
      if letter_hash.include?(other_letter)
        letter_hash.delete(other_letter)
        p "delete #{other_letter}"
      else
        is_anagram = false
      end
      p "  hash = #{letter_hash}"
    end
    is_anagram & letter_hash.empty?()
  end
end

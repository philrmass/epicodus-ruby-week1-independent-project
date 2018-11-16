class WordCompare
  def initialize(word)
    @word = word.downcase()
    @letter_hash = Hash.new()
    letters = @word.split('')
    letters.each do |letter|
      if @letter_hash.include?(letter)
        letter_count = @letter_hash.fetch(letter) + 1
        @letter_hash[letter] = letter_count
      else
        @letter_hash.store(letter, 1)
      end
    end
  end

  def anagram(other_word)
    is_anagram = true
    letter_hash = @letter_hash.clone
    p "START  other=#{other_word}  hash=#{letter_hash}"
    other_letters = other_word.downcase().split('')
    other_letters.each do |other_letter|
      if letter_hash.include?(other_letter)
        letter_count = letter_hash.fetch(other_letter)
        if letter_count <= 1
          letter_hash.delete(other_letter)
          p "  DELETE #{other_letter}  hash=#{letter_hash}"
        else
          letter_hash[other_letter] = letter_count - 1
          p "  DEC #{other_letter}  cnt=#{letter_count - 1}  hash=#{letter_hash}"
        end
      else
        p "  MISSING #{other_letter}  hash=#{letter_hash}"
        is_anagram = false
      end
    end
    p "END(#{is_anagram && letter_hash.empty?()})  isAna=#{is_anagram}  hash=#{letter_hash}"
    is_anagram & letter_hash.empty?()
  end
end

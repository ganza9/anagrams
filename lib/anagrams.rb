require('pry')

class Word
  attr_reader(:first_word, :second_word)
  def initialize (first_word,second_word)
    @first_word = first_word.downcase
    @second_word = second_word.downcase
    @first_word_array = @first_word.split(' ')
    @second_word_array = @second_word.split(' ')
  end

  def antigram?
    first_array = @first_word_array.join('').gsub(/[^a-zA-Z]/i, '').split('').uniq
    second_array = @second_word_array.join.gsub(/[^a-zA-Z]/i, '').split('').uniq

    antigram_array = []

    for i in 1..first_array.length do
      second_array.each do |array_element|
        if array_element.include?(first_array[i-1].to_s)
          antigram_array.push(1)
        else
          antigram_array.push(0)
        end
      end
    end
    if antigram_array.reduce(:+) < 1
      true
    else
      false
    end
  end

  def word?
    combined_inputs = @first_word_array +  @second_word_array
    input_is_not_word=[]

    for i in 1..combined_inputs.length do
     if  combined_inputs[(i-1)] !~ /[aeiouy]/
       input_is_not_word.push(1)
     else
       input_is_not_word.push(0)
      end
    end
    if input_is_not_word.reduce(:+) > 0
      false
    else
      true
    end
  end

  def anagram?
    first_word_key = @first_word.gsub(/\s+/, "").split('').sort.join('')
    second_word_key = @second_word.gsub(/\s+/, "").split('').sort.join('')
    if first_word_key == second_word_key
      if @first_word.reverse.split(' ').join('') == @second_word_array.join('')
        "These words are anagrams of each other and form a palindrome."
      else
        "These words are anagrams of each other but don't form a palindrome."
      end
    else
       "This is neither a word or palindrome."
    end
  end
end



puts "Please enter your first word"
first_entry = gets.chomp
puts "\n"
puts "Please enter your second word"
second_entry = gets.chomp
puts "\n"
word_entries = Word.new(first_entry,second_entry)

is_word = word_entries.word?()
is_anagram = word_entries.anagram?()
is_antigram = word_entries.antigram?()

if is_word == true
  if is_antigram == true
    puts "The pharase you entered is an antigram"
  else
  puts is_anagram
  end
else
  puts "Please enter a real word(must contain at least one vowell)."
end

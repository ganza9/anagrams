require('pry')

def intialize(first_word, second_word)
  @first_word = first_word.downcase
  @second_word = second_word.downcase
end

puts "Please enter first word"
first_word = [gets.chomp]

puts "Please enter second word"
second_word = [gets.chomp]

class String

binding.pry
  def anagram?

    if first_word[i].chars.sort == second_word[i].chars.sort
      puts "this is an anagram"
    else
      puts "this is not an anagram"
    end
    binding.pry
  end
end

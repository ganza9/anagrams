require('pry')

puts "Please enter first word"
first_word = [gets.chomp]

puts "Please enter second word"
second_word = [gets.chomp]

first_word.sort == second_word.sort


if first_word.sort == second_word.sort
  puts true
else
  puts false
end

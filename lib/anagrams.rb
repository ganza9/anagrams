
puts "Please enter first word"
first_word = [gets.chomp]

puts "Please enter second word"
second_word = [gets.chomp]

for i in 0..first_word.length-1
  if first_word[i].chars.sort == second_word[i].chars.sort
    puts true
  else
    puts false
  end
end

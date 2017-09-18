
require('rspec')
require('anagrams')
require('pry')

describe('#Anagram_checker')  do
 it("returns true if the two words inputted are anagrams") do
   compare_words = Word.new("tea", "eat")
   expect(compare_words.anagram?()).to(eq("These words are anagrams of each other but don't form a palindrome."))
 end

 it("accounts for entries of different cases") do
   compare_words = Word.new("Tea", "eAt")
   expect(compare_words.anagram?()).to(eq("These words are anagrams of each other but don't form a palindrome."))
 end

 it("checks whether two words are palindromes") do
   compare_words = Word.new("Tarawa", "A war at")
   expect(compare_words.anagram?()).to(eq("These words are anagrams of each other and form a palindrome."))
 end

 it("checks to make sure every inputted word has at least one vowell") do
 compare_words = Word.new("Tarawa", "A war at")
 expect(compare_words.word?()).to(eq(true))
 end

 it("checks if two inputted words are antigrams") do
  compare_words = Word.new("xqapx", "vuv")
  expect(compare_words.antigram?()).to(eq(true))
 end

 it("checks if two inputted phrases are antigrams") do
  compare_words = Word.new("xqapx ce", "vuv yo")
  expect(compare_words.antigram?()).to(eq(true))
 end
end

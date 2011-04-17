require "wordSandwich.rb"

# wordSandwichMain.rb - this program drives wordSandwich


#You can use loadLengthWords.rb to create a file that contains only words of a certain length.
#For example, the "Word Sandwich Online Game" uses only 5 letter words. Use loadLengthWords 
#to create a file that only have 5 letter words.

@fiveLetterWordArray = Array.new

File.foreach('my5Target.txt') do |word|
  word = word.chomp #the words have \n after each word. Remove those line endings
  @fiveLetterWordArray.push(word)
end

puts "Length of the array is #{@fiveLetterWordArray.length} words"
puts "First word is #{@fiveLetterWordArray.first} and last word is #{@fiveLetterWordArray.last}"
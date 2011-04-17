
#letters5DictWordArray = load words from word loader
myWordSandwich = WordSandwich.new(letters5DictWordArray)
midpointIndex = midQt(myWordSandwich.length) + 0 #we get an offset, so we add it to the first index
#set midpointIndex
myWordSandwich.setWordArrayMidPt(midpointIndex)
puts myWordSandwich.midPtValue(midpointIndex) #show the 1st value

askHighLowDone #ask users where this falls in the game
userInput = getInput
myWordSandwich.hone(userInput) #sets internal variables wordArrayMin and wordArrayMax to new values
myWordSandwich.giveHalf(userInput) #if done, we exit the program; if high, giveHalf gives the lower half
exampleWordSandiwch.new([0 1 2 3 4 5 6 7 8 9 10]) *
midpoint = 0 + midQt(exampleWordSandwich.length)
exampleWordSandwich.setWordArrayMidPt(midpoint)
exampleWordSandwich.hone(userInput) sets a new min or max index inside the class
exampleWordSandwich.giveHalf - then uses the recently set min/max value to find the new midpoint
puts "We suggest you use the word #{exampleWordSandiwch.midPtValue}"
askHighLowDone
userInput = getInput
exampleWordSandwich.hone(userInput) #continue to repeat the process. Use a loop while hone(userInput) != 0





* for odd arrays:
in case [0 1 2 3 4 5 6 7 8 9 10 11]; midpoint = floor((11-0+1)/2)=6; 
a  suggest(midpoint, userInput) yields 0, 5; when midpoint = 6
b  suggest(midpoint, userInput) yields 7, 11; when midpoint = 6
  a new midpoint = floor((5-0+1)/2) = 3; <= offsets
  b new midpoint = floor((11-7+1)/2) = 2 <= offsets
    a giveHalf(high)  performs wordArrayMax = 0+3-1 = 2; array indices [0,2]
    a1 giveHalf(low)  performs wordArrayMin = 7+2 = 9; array indices [9, 11]
    
    
#Note: Keep track of the way data is transferred. We are going to run into issues 
#because midQt gives an offset. So data must be dealt with correspondingly.
#2nd issue is that we repeat the types of functionality --- so this is causing a problem
#too many of the methods are similar. 
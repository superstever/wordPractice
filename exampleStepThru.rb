
#letters5DictWordArray = load words from word loader
myWordSandwich = WordSandwich.new(letters5DictWordArray)
midpointIndex = midQt(myWordSandwich.length)
midpoint = myWordSandwich.value(midpointIndex)

askHighLowDone
userInput = getInput
myWordSandwich.giveHalf(userInput) #if done, we exit the program; if high, giveHalf gives the lower half
[0 1 2 3 4 5 6 7 8 9 10] *
midpoint = 5 <= this is an offset *
suggest(midpoint, userInput) yields 0, 4
what it needs is a new midpoint = floor((4-0+1)/2)    | option is floor((6+10)/2) 8

askHighLowDone
userInput = getInput
suggest(midpoint, userInput)

giveHalf operates on 0, 4    4-0+1 = 5/2 = 2; 0+2-1 = 1 is new max!?




* for odd arrays:
in case [0 1 2 3 4 5 6 7 8 9 10 11]; midpoint = floor((11-0+1)/2)=6; 
a  suggest(midpoint, userInput) yields 0, 5; when midpoint = 6
b  suggest(midpoint, userInput) yields 7, 11; when midpoint = 6
  a new midpoint = floor((5-0+1)/2) = 3; <= offsets
  b new midpoint = floor((11-7+1)/2) = 2 <= offsets
    a giveHalf(high)  performs wordArrayMax = 0+3-1 = 2; array indices [0,2]
    a1 giveHalf(low)  performs wordArrayMin = 7+2 = 9; array indices [9, 11]
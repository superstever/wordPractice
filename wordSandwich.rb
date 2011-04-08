#wordSandwich.rb

def callExtMethodTest(x, y)
  puts "We received a call for this method. Values are #{x} and #{y}"
end

class WordSandwich
  def initialize(wordArray)
    @wordArray = wordArray
  end
  
  def length
    return @wordArray.length
  end
end

def askHighLowCorrect
  return "Was the suggestion high, low or correct?"
end

def directionResponse(userInput)
  case userInput.downcase
  when 'h', 'high', 'hi' then
    return 1
  when 'l','low', 'lo' then
    return -1
  when 'd', 'done', 'do', 'don' then
    return 0
  else 
    return 0
  end #end case
end

def midQt(arrayLength)
  midQuantity = arrayLength/2
  midQuantity = midQuantity.floor
  return midQuantity
end

#*Using the correct quantity offset (This is the method you should use)
#indices = 12, 13, 14, 15, 16, 17, 18, 19, 20, 21
#midQt = 21 - 12 + 1 = 10/2 = 5
#we should have a lower range of 12 to 16; minIndex, minIndex+midQt-1
#we should have an upper range of 17 to 21; minIndex+midQt, maxindex
#
#indices = 12, 13, 14, 15, 16, 17, 18, 19, 20
#midQt = 20 - 12 + 1 = 9/2 = 4.5 floor = 4
#we should have a lower range of 12 to 15; minIndex, minIndex+midQt-1
#we should have an upper range of 16 to 20; minIndex+midQt, maxIndex
def recalibrate(wordArrayMin, wordArrayMax, directionInput)
  case directionResponse(directionInput)
  when -1 then
    offsetMidQ = midQt(wordArrayMax-wordArrayMin+1)
    newMid = wordArrayMin + offsetMidQ - 1
    return wordArrayMin, newMid
  when 0 then
    return 'done0', 'done1'
  when 1 then
    offsetMidQ = midQt(wordArrayMax-wordArrayMin+1)
    newMid = wordArrayMin + offsetMidQ
    return newMid, wordArrayMax
  end
  
end
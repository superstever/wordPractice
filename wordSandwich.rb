#wordSandwich.rb


class WordSandwich
  def initialize(wordArray)
    @wordArray = wordArray
    @wordArrayMin = 0
    @wordArrayMax = @wordArray.length-1
  end
  
  def value
     return @wordArray
  end
  
  def wordArrayMin
    return @wordArrayMin
  end
  
  def wordArrayMax
    return @wordArrayMax
  end
  
  def setWordArrayMin(arrayIndexMin)
    @wordArrayMin = arrayIndexMin
  end
  
  def setWordArrayMax(arrayIndexMax)
    @wordArrayMax = arrayIndexMax
  end
  
  def length
    return @wordArray.length
  end
  
  #giveHalf should update a variable instead of returning a value.
  #also create a reader method to read those variables
  
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
  def giveHalf(wordArrayMin, wordArrayMax, directionInput)
    case directionResponse(directionInput)
    when -1 then
      offsetMidQ = midQt(wordArrayMax-wordArrayMin+1)
        @wordArrayMin = wordArrayMin
        @wordArrayMax = wordArrayMin + offsetMidQ - 1
    when 0 then
      quitProgram
    when 1 then
      offsetMidQ = midQt(wordArrayMax-wordArrayMin+1)
      @wordArrayMin = wordArrayMin + offsetMidQ
      @wordArrayMax = wordArrayMax
    end 
  end
  
end

def askHighLowCorrect
  return "Was the suggestion high, low or correct?"
end

def directionResponse(userInput)
  case userInput.downcase
  when 'h', 'high', 'hi' then
    return -1
  when 'l','low', 'lo' then
    return 1
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


#when given an array range, discerned by the wordArrayMin and wordArrayMax, it will use the directionInput
#to exclude the incorrectly suggested word in the new array range. For example, if we have an array
#exampleArray = ["ten", "twenty", "thirty", "forty", "fifty", "sixty", "seventy", "eighty", "ninety", "one-hundred", "one-ten", "one-twenty", "one-thirty", "one-forty", "one-fifty"]
#The user types in "ninety" in the Word Sandwich game. That value is too high. Then 
def updateWordRange(wordArrayMin, wordArrayMax, directionInput)
  case directionResponse(directionInput)
  when -1 then
    return wordArrayMin, wordArrayMax-1 #gives a new range that excludes the erroneous suggestion
  when 1 then
    return wordArrayMin+1, wordArrayMax
  when 0 then
    quitProgram
  end
end

def suggest(wordArrayMin, wordArrayMax, directionInput)
  case directionResponse(directionInput)
  when -1 then
    return wordArrayMax-1 #gives a new range that excludes the erroneous suggestion
  when 1 then
    return wordArrayMin+1
  when 0 then
    return 'done'
  end
end

def quitProgram
  puts "Great. You typed 'done. Goodbye!"
  return 0 
end
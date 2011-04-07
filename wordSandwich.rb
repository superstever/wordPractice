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
  
  def midPt(arrayLength)
    midIndex = arrayLength/2
    midIndex = midIndex.floor
    return midIndex
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
  end #end case
end
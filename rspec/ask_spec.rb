#Note -- $> rspec ask_spec.rb to run tests; use $> rspec ask_spec.rb -fs  to get verbose output; -c for color

#require 'spec_helper'
require '../wordSandwich.rb'

class Ask

  describe "initializing the word sandwich object should create an object" do
    it "whose length can be read" do
      evenArray = ["ten", "twenty", "thirty", "forty", "fifty", "sixty", "seventy", "eighty", "ninety", "one-hundred"]
      aSandwich = WordSandwich.new(evenArray)
      aSandwich.length.should equal(evenArray.length)
    end
    
    it "whose first item is known" do
      evenArray = ["ten", "twenty", "thirty", "forty", "fifty", "sixty", "seventy", "eighty", "ninety", "one-hundred"]
      aSandwich = WordSandwich.new(evenArray)
      aSandwich.value.first.should equal(evenArray.first)      
    end
    
    it "whose last item is known" do
      evenArray = ["ten", "twenty", "thirty", "forty", "fifty", "sixty", "seventy", "eighty", "ninety", "one-hundred"]
      aSandwich = WordSandwich.new(evenArray)
      aSandwich.value.last.should equal(evenArray.last)
    end
    
    it "whose minIndex can be called" do
      evenArray = ["ten", "twenty", "thirty", "forty", "fifty", "sixty", "seventy", "eighty", "ninety", "one-hundred"]
      aSandwich = WordSandwich.new(evenArray)
      aSandwich.wordArrayMin.should equal(0)
    end
    
    it "whose maxIndex can be called" do
      evenArray = ["ten", "twenty", "thirty", "forty", "fifty", "sixty", "seventy", "eighty", "ninety", "one-hundred"]
      aSandwich = WordSandwich.new(evenArray)
      aSandwich.wordArrayMax.should equal(9)
    end
    
    it "should be settable for min index" do
      evenArray = ["ten", "twenty", "thirty", "forty", "fifty", "sixty", "seventy", "eighty", "ninety", "one-hundred"]
      aSandwich = WordSandwich.new(evenArray)
      testValue = 1
      aSandwich.setWordArrayMin(testValue)
      aSandwich.wordArrayMin.should equal(testValue)
    end
    
    it "should be settable for max index" do
      evenArray = ["ten", "twenty", "thirty", "forty", "fifty", "sixty", "seventy", "eighty", "ninety", "one-hundred"]
      aSandwich = WordSandwich.new(evenArray)
      testValue = 5
      aSandwich.setWordArrayMax(testValue)
      aSandwich.wordArrayMax.should equal(testValue)
    end
    
    it "should be settable for the midpoint" do
      evenArray = ["ten", "twenty", "thirty", "forty", "fifty", "sixty", "seventy", "eighty", "ninety", "one-hundred"]
      aSandwich = WordSandwich.new(evenArray)
      testValue = 4
      aSandwich.setWordArrayMidPt(testValue)
      aSandwich.wordArrayMidPt.should equal(testValue)
    end
    
    it "should return the correct midpoint value for a given midpoint index" do
      evenArray = ["ten", "twenty", "thirty", "forty", "fifty", "sixty", "seventy", "eighty", "ninety", "one-hundred"]
      aSandwich = WordSandwich.new(evenArray)
      testValue = 4
      aSandwich.setWordArrayMidPt(testValue)
      aSandwich.midPtValue.should equal(evenArray[testValue])      
    end
  end
  
  describe "Calculate middle quantity" do
    it "that gives you half the array size for an EVEN array size" do
      arraySize = 10
      midQt(arraySize).should equal(5)
    end
    
    it "that gives you a quantity (half-1) the array size for an ODD array size" do
      arraySize = 9
      midQt(arraySize).should equal(4)
    end
  end
  
  describe "Prompt" do
    it "asks you if the suggestion was high, low or correct" do
      askHighLowDone.should match(/high, low or correct/)
    end
    
    it "gets a 'high' in any case and formats it to a 1" do
      directionResponse('h').should equal(-1)
      directionResponse('H').should equal(-1)
      directionResponse('high').should equal(-1)
      directionResponse('High').should equal(-1)
      directionResponse('hi').should equal(-1)  
      directionResponse('Hi').should equal(-1) 
      directionResponse('hiGH').should equal(-1)     
    end
    
    it "gets a 'low' in any case and formats it to a -1" do
      directionResponse('l').should equal(1)
      directionResponse('L').should equal(1) 
      directionResponse('low').should equal(1) 
      directionResponse('Low').should equal(1)
      directionResponse('lo').should equal(1)  
      directionResponse('Lo').should equal(1) 
      directionResponse('lOW').should equal(1) 
    end
    
    it "gets a 'done' in any case and formats it to a 0" do
      directionResponse('d').should equal(0) 
      directionResponse('D').should equal(0) 
      directionResponse('done').should equal(0) 
      directionResponse('Done').should equal(0) 
      directionResponse('do').should equal(0) 
      directionResponse('don').should equal(0) 
      directionResponse('doNE').should equal(0) 
    end
  end
  
  #TODO: test should be written to access the wordArrayMax and wordArrayMin variables.
  #the giveHalf function should update the variable.
  
  describe "The word sandwich object should have the correct logic" do
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
    it "- should spit out the correct indices for an EVEN array with high direction" do
      evenIndices = 12, 13, 14, 15, 16, 17, 18, 19, 20, 21
      bSandwich = WordSandwich.new(evenIndices)
#      solnArray = [12, 16]
      newMidPt = (21-12+1)/2-1   #create the new midpt offset
      bSandwich.setWordArrayMin(evenIndices.first) #we are using the value of each element as the index. So we set the min to index 12 for this test
      bSandwich.setWordArrayMax(evenIndices.last)
      bSandwich.giveHalf
#      bSandwich.giveHalf('high')
#      actualArray = [bSandwich.wordArrayMin, bSandwich.wordArrayMax]
#      actualArray.should == solnArray
      bSandwich.wordArrayMidPt.should == (evenIndices.first + newMidPt) #we add the offset to the first index and compare that result to giveHalf
    end
    
    it "- should spit out the correct indices for an ODD array with high direction" do
      oddIndices = 12, 13, 14, 15, 16, 17, 18, 19, 20
      bSandwich = WordSandwich.new(oddIndices)
#      solnArray = [12, 15]
      newMidPt = ((20-12+1)/2-1).floor #create the new midpt offset
      bSandwich.setWordArrayMin(oddIndices.first)
      bSandwich.setWordArrayMax(oddIndices.last)
      bSandwich.giveHalf
#      bSandwich.giveHalf('high')
#      actualArray = [bSandwich.wordArrayMin, bSandwich.wordArrayMax]
#      actualArray.should == solnArray
      bSandwich.wordArrayMidPt.should == (oddIndices.first + newMidPt)
      
    end
    
    it "- should spit out the correct indices for an EVEN array with low direction" do
      evenIndices = 12, 13, 14, 15, 16, 17, 18, 19, 20, 21
      bSandwich = WordSandwich.new(evenIndices)
#      solnArray = [17, 21]
      newMidPt = (21-12+1)/2-1  #create the new midpt offset
      bSandwich.setWordArrayMin(evenIndices.first)
      bSandwich.setWordArrayMax(evenIndices.last)
      bSandwich.giveHalf
#      bSandwich.giveHalf('low')
#      actualArray = [bSandwich.wordArrayMin, bSandwich.wordArrayMax]
#      actualArray.should == solnArray
      bSandwich.wordArrayMidPt.should == (evenIndices.first + newMidPt)
    end
    
    it "- should spit out the correct indices for an ODD array with low direction" do
      oddIndices = 12, 13, 14, 15, 16, 17, 18, 19, 20
      bSandwich = WordSandwich.new(oddIndices)
#      solnArray = [16, 20]
      newMidPt = (20-12+1)/2 - 1
      bSandwich.setWordArrayMin(oddIndices.first)
      bSandwich.setWordArrayMax(oddIndices.last)
      bSandwich.giveHalf
#      bSandwich.giveHalf('low') #create the new midpt offset
#      actualArray = [bSandwich.wordArrayMin, bSandwich.wordArrayMax]
#      actualArray.should == solnArray
      bSandwich.wordArrayMidPt.should == (oddIndices.first + newMidPt)
    end
    
    it "- should run the exit routine if the user types in 'done'" do
      oddIndices = 12, 13, 14, 15, 16, 17, 18, 19, 20
      bSandwich = WordSandwich.new(oddIndices)
      bSandwich.hone('done').should equal(0)
    end
    
    it " - should make a suggestion for the user that is the max array end point if 'high'" do
      exampleArray = ["ten", "twenty", "thirty", "forty", "fifty", "sixty", "seventy", "eighty", "ninety", "one-hundred", "one-ten", "one-twenty", "one-thirty", "one-forty", "one-fifty"]
      cSandwich = WordSandwich.new(exampleArray)
      cSandwich.setWordArrayMin(exampleArray[1])
      cSandwich.setWordArrayMax(exampleArray[4])
      cSandwich.setWordArrayMidPt(4)
      cSandwich.hone("high")
      cSandwich.wordArrayMax.should  equal(exampleArray.find_index('forty'))
    end
    
    it " - should make a suggestion for the user that is the min array end point if 'low" do
      exampleArray = ["ten", "twenty", "thirty", "forty", "fifty", "sixty", "seventy", "eighty", "ninety", "one-hundred", "one-ten", "one-twenty", "one-thirty", "one-forty", "one-fifty"]
      cSandwich = WordSandwich.new(exampleArray)
      cSandwich.setWordArrayMin(exampleArray[1])
      cSandwich.setWordArrayMax(exampleArray[4])
      cSandwich.setWordArrayMidPt(1)
      cSandwich.hone("low")
      cSandwich.wordArrayMin.should  equal(exampleArray.find_index('thirty'))
    end
    
    #let's see if we can avoid using midpt all together in the routine. Is it possible
    #to solely rely on giveHalf? This way we can have more consistent code
    it " - for curiosity. Does midpt equal giveHalf?" do
      evenIndices = 12, 13, 14, 15, 16, 17, 18, 19, 20, 21      
      dSandwich = WordSandwich.new(evenIndices)
      dSandwich.setWordArrayMin(evenIndices.first)
      dSandwich.setWordArrayMax(evenIndices.last)
      dSandwich.giveHalf.should ==(midQt(evenIndices.length) + evenIndices.first)
    end
    
  end
  
  
  describe "logic" do 

    
    it "- should suggest the correct index given a direction on the first case" do
      #If we give it an array of indices = 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14
      #and run midPt - we get a starting index to test. This is our first suggestion.
      exampleIndices = 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14
      exampleArray = ["ten", "twenty", "thirty", "forty", "fifty", "sixty", "seventy", "eighty", "ninety", "one-hundred", "one-ten", "one-twenty", "one-thirty", "one-forty", "one-fifty"]
      exampleIndices.length.should equal(exampleArray.length) #make sure my indices and exampleArray are the same length for the test cases
      exampleArray[midQt(exampleArray.length)].should == ("eighty")
    end

#optional remove    
    it "- should then suggest the correct range to run recursion when given a low on the first case" do
      #If we give it an array of indices = 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14
      #and run midPt - we get a starting index to test. This is our first suggestion.
      exampleIndices = 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14
      exampleArray = ["ten", "twenty", "thirty", "forty", "fifty", "sixty", "seventy", "eighty", "ninety", "one-hundred", "one-ten", "one-twenty", "one-thirty", "one-forty", "one-fifty"]
      userResponse = 'low'
      solnArray = [1, 14]
      updateWordRange(exampleArray.find_index('ten'), exampleArray.find_index('one-fifty'), 'low').should == solnArray
    end
#optional remove    
    it "- should then suggest the correct range to run recursion when given a high on the first case" do
      exampleIndices = 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14
      exampleArray = ["ten", "twenty", "thirty", "forty", "fifty", "sixty", "seventy", "eighty", "ninety", "one-hundred", "one-ten", "one-twenty", "one-thirty", "one-forty", "one-fifty"]
      userResponse = 'high'
      solnArray = [0, 13]
      updateWordRange(exampleArray.find_index('ten'), exampleArray.find_index('one-fifty'), 'high').should == solnArray
    end
    
  end #end "logic"

end #end Class Ask
#Note -- $> rspec ask_spec.rb to run tests; use $> rspec ask_spec.rb -fs  to get verbose output; -c for color

#require 'spec_helper'
require '../wordSandwich.rb'

class Ask
  describe "read from external ruby file" do
    callExtMethodTest(1,2)
  end
  
  describe "initializing the word sandwich object should create an object" do
    it "whose length can be read" do
      evenArray = ["ten", "twenty", "thirty", "forty", "fifty", "sixty", "seventy", "eighty", "ninety", "one-hundred"]
      aSandwich = WordSandwich.new(evenArray)
      aSandwich.length.should equal(evenArray.length)
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
      askHighLowCorrect.should match(/high, low or correct/)
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
  
  describe "logic" do
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
      solnArray = [12, 16]
      giveHalf(12, 21, 'high').should == solnArray
    end
    
    it "- should spit out the correct indices for an ODD array with high direction" do
      solnArray = [12, 15]
      giveHalf(12, 20, 'high').should == solnArray
    end
    
    it "- should spit out the correct indices for an EVEN array with low direction" do
      solnArray = [17, 21]
      giveHalf(12, 21, 'low').should == solnArray
    end
    
    it "- should spit out the correct indices for an ODD array with low direction" do
      solnArray = [16, 20]
      giveHalf(12, 20, 'low').should == solnArray
    end   

    #maybe create a condition for done
    
    it "- should suggest the correct index given a direction on the first case" do
      #If we give it an array of indices = 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14
      #and run midPt - we get a starting index to test. This is our first suggestion.
      exampleIndices = 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14
      exampleArray = ["ten", "twenty", "thirty", "forty", "fifty", "sixty", "seventy", "eighty", "ninety", "one-hundred", "one-ten", "one-twenty", "one-thirty", "one-forty", "one-fifty"]
      exampleIndices.length.should equal(exampleArray.length) #make sure my indices and exampleArray are the same length for the test cases
      exampleArray[midQt(exampleArray.length)].should == ("eighty")
    end
    
    it "- should then suggest the correct range to run recursion when given a low on the first case" do
      #If we give it an array of indices = 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14
      #and run midPt - we get a starting index to test. This is our first suggestion.
      exampleIndices = 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14
      exampleArray = ["ten", "twenty", "thirty", "forty", "fifty", "sixty", "seventy", "eighty", "ninety", "one-hundred", "one-ten", "one-twenty", "one-thirty", "one-forty", "one-fifty"]
      userResponse = 'low'
      solnArray = [1, 14]
      updateWordRange(exampleArray.find_index('ten'), exampleArray.find_index('one-fifty'), 'low').should == solnArray
    end
    
    it "- should then suggest the correct range to run recursion when given a high on the first case" do
      exampleIndices = 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14
      exampleArray = ["ten", "twenty", "thirty", "forty", "fifty", "sixty", "seventy", "eighty", "ninety", "one-hundred", "one-ten", "one-twenty", "one-thirty", "one-forty", "one-fifty"]
      userResponse = 'high'
      solnArray = [0, 13]
      updateWordRange(exampleArray.find_index('ten'), exampleArray.find_index('one-fifty'), 'high').should == solnArray
    end
    
    it "should make a suggestion for the user that is the max array end point if 'high'" do
      exampleArray = ["ten", "twenty", "thirty", "forty", "fifty", "sixty", "seventy", "eighty", "ninety", "one-hundred", "one-ten", "one-twenty", "one-thirty", "one-forty", "one-fifty"]
      suggest(exampleArray.find_index('twenty'), exampleArray.find_index('fifty'), "high").should  equal(exampleArray.find_index('forty'))
    end
    
    it "should make a suggestion for the user that is the min array end point if 'low" do
      exampleArray = ["ten", "twenty", "thirty", "forty", "fifty", "sixty", "seventy", "eighty", "ninety", "one-hundred", "one-ten", "one-twenty", "one-thirty", "one-forty", "one-fifty"]
      suggest(exampleArray.find_index('twenty'), exampleArray.find_index('fifty'), "low").should  equal(exampleArray.find_index('thirty'))
    end
  end #end "logic"

#this finishing function causes the program to quit before it can get a reading. Explore stubs and mocks  http://stackoverflow.com/questions/1480537/how-can-i-validate-exits-and-aborts-in-rspec
# describe "finishing" do
#   it "ends gracefully when told 'done' in the 'giveHalf' method" do
#   lambda giveHalf(1, 4, 'done').should exit_with_code(0)
##   lambda giveHalf(1, 4, 'done').should raise_error SystemExit
#  end
# end
end #end Class Ask
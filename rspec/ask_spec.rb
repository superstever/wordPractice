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
      directionResponse('h').should equal(1)
      directionResponse('H').should equal(1)
      directionResponse('high').should equal(1)
      directionResponse('High').should equal(1)
      directionResponse('hi').should equal(1)  
      directionResponse('Hi').should equal(1) 
      directionResponse('hiGH').should equal(1)     
    end
    
    it "gets a 'low' in any case and formats it to a -1" do
      directionResponse('l').should equal(-1)
      directionResponse('L').should equal(-1) 
      directionResponse('low').should equal(-1) 
      directionResponse('Low').should equal(-1)
      directionResponse('lo').should equal(-1)  
      directionResponse('Lo').should equal(-1) 
      directionResponse('lOW').should equal(-1) 
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
    it "- should spit out the correct indices for an EVEN array with low direction" do
      solnArray = [12, 16]
      recalibrate(12, 21, 'low').should == solnArray
    end
    
    it "- should spit out the correct indices for an ODD array with low direction" do
      solnArray = [12, 15]
      recalibrate(12, 20, 'low').should == solnArray
    end
    
    it "- should spit out the correct indices for an EVEN array with high direction" do
      solnArray = [17, 21]
      recalibrate(12, 21, 'high').should == solnArray
    end
    
    it "- should spit out the correct indices for an ODD array with high direction" do
      solnArray = [16, 20]
      recalibrate(12, 20, 'high').should == solnArray
    end   
  end #end "logic"
  
  describe "correct halves" do
    it "gives the proper half-value when told 'lower'"
    it "gives the proper half-value when told 'higher'"
  end
  
  describe "finishing" do
    it "ends gracefully when told 'done'"
  end
end
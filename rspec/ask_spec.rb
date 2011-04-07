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
    
    it "that can give you a mid point index of half the array size for an EVEN array size" do
      evenArray = ["ten", "twenty", "thirty", "forty", "fifty", "sixty", "seventy", "eighty", "ninety", "one-hundred"]
      aSandwich = WordSandwich.new(evenArray)
      arraySize = 10
      aSandwich.midPt(arraySize).should equal(5)
    end
    
    it "that can give you a mid point (half-1) the array size for an ODD array size" do
      evenArray = ["ten", "twenty", "thirty", "forty", "fifty", "sixty", "seventy", "eighty", "ninety", "one-hundred"]
      aSandwich = WordSandwich.new(evenArray)
      arraySize = 9
      aSandwich.midPt(arraySize).should equal(4)
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
  
  describe "correct halves" do
    it "gives the proper half-value when told 'lower'"
    it "gives the proper half-value when told 'higher'"
  end
  
  describe "finishing" do
    it "ends gracefully when told 'done'"
  end
end
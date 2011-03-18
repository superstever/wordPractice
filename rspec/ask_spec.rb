#require 'spec_helper'

class Ask
  describe "initial prompt" do
    it "gives you the correct index on an even array" do
      evenArray = ["ten", "twenty", "thirty", "forty", "fifty", "sixty", "seventy", "eighty", "ninety", "one-hundred"]
      ans = evenArray.length/2
      ans = ans.floor
      ans.should equal(5)
      #create a halfFunction so you don't have to write the algorithm. and then test it
    end
    it "gives you the correct index on an odd array" do
      evenArray = ["ten", "twenty", "thirty", "forty", "fifty", "sixty", "seventy", "eighty", "ninety", "one-hundred"]
      evenArray.pop
      oddArray = evenArray
      puts oddArray
      ans = oddArray.length/2
      ans = ans.floor
      ans.should equal(4)
            #create a halfFunction so you don't have to write the algorithm. and then test it
    end
    it "asks you if it's up, down or done"
  end
  
  describe "correct halves" do
    it "gives the proper half-value when told 'lower'"
    it "gives the proper half-value when told 'higher'"
  end
  
  describe "finishing" do
    it "ends gracefully when told 'done'"
  end
end
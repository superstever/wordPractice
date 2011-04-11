#test scope of variables
#varScope

class Outer
  @@noAmpersandArray = ["no ampersand", "none ampersand", "niet ampersand"]
  def initialize(userArray)
    @internalArray = userArray
  end
  
  def read
    puts @internalArray
  end

  def readLocalArray
    localArray = ["local", "locals", "localz"]
    puts localArray
  end

  
  def readOuterArray
    @externalArray = ["external", "outside array", "this is outside"]
    puts @externalArray
  end
  
  def readAllArrays
    puts @internalArray
    puts "Can't read local array because it does not have the ampersand"
    puts @externalArray
    puts @@noAmpersandArray
  end
end
puts
myArray = ["internal array", "internalz", "inside"]
myOuter = Outer.new(myArray)
puts "Let's see what the internal array is"
myOuter.read
puts "Local array is "
myOuter.readLocalArray
puts " The external array is an ampersand array defined in a method:"
myOuter.readOuterArray
puts
puts "Let's read all arrays:"
myOuter.readAllArrays

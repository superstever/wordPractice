#testNewFile.rb
#test folder hierarchy - creates a new file with the name you type in and id you type in 
#into a folder that is parallel to this rb file.


#define the class
class CreateFileHigherHierarchy


  def initialize(file)
    @newFile0 = File.new(file, "w")
  end
  
  attr_reader :fp
  def createSingleRecord(file)
    puts "What is your name?"
    name = gets.chomp
    puts "What is your id?"
    id = gets.chomp
    @fp = File.open(file, 'w')
    @fp.puts "#{id}, #{name}"
  end
  
  def close
    @fp.close
  end
end

testFile = './dicts/test1.txt'
newFile = CreateFileHigherHierarchy.new(testFile)
newFile.createSingleRecord(testFile)
newFile.close
#loadTenWords
#will load ten words from the dictionary that runs parallel.
#it will put the words in a new file

#this one is alittle ugly because I have two files initialized/opened in one method. See "LoadLengthWords.rb," it's nicer.

class LoadWords
  def initialize(sourceFile, targetFile)
    @sourcePtr = File.open(sourceFile, 'r')
    @targetPtr = File.new(targetFile, 'a')
  end
  
  def load(numberOfWords)
    numberOfWords.times do
      @targetPtr.puts @sourcePtr.gets
    end
  end
  
  def close
    @sourcePtr.close
    @targetPtr.close
  end
end

load10 = LoadWords.new('./dicts/web2', 'myTarget.txt')
load10.load(10)
load10.close
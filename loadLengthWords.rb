#loadLengthWords
#will load only words from the dictionary of a certain length

class LoadWords
  def initialize(targetFile)
    @targetPtr = File.new(targetFile, 'w') #overwrites over targetfile
  end
  
  def loadLength(wordLength, sourceFile)
    File.foreach(sourceFile) do |word|
      word = word.chomp
      if word.length == wordLength
        @targetPtr.puts word
      end
    end
  end
  
  def close
    @targetPtr.close
  end
end


length = 5
sourceFilez = './dicts/web2'
targetFilez='my5Target.txt'
load5 = LoadWords.new(targetFilez)
load5.loadLength(5, sourceFilez)
load5.close
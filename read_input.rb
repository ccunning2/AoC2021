module ReadInput
    #Loads each line from a file into an array (removing line separator)
    def ReadInput.read(file)
        inputArr = []
        f = File.new(file)
        inputArr << f.gets.chomp until f.eof?
        inputArr
    end
    #Same as read, but parse to int
    def ReadInput.readInt(file)
        inputArr = []
        f = File.new(file)
        inputArr << f.gets.chomp.to_i until f.eof?
        inputArr
    end

    #The first column of input (from top to bottom) becomes the first row(from left to right)
    def ReadInput.transpose(file)
        inputArr = []
        f = File.new(file) 
        inputArr << f.gets.chomp.split('') until f.eof? 
        inputArr.transpose
    end

    
    def ReadInput.read_split(file)
        inputArr = []
        f = File.new(file) 
        inputArr << f.gets.chomp.split('') until f.eof? 
        inputArr
    end


end